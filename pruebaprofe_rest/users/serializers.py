from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from users.models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"


class CustomTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        email = attrs.get("email", "")
        password = attrs.get("password", "")

        if email and password:
            user = User.objects.filter(email=email).first()

            if user and user.check_password(password):
                data["user"] = user
            else:
                raise serializers.ValidationError("Credenciales inválidas")
        else:
            raise serializers.ValidationError(
                "El correo electrónico y la contraseña son necesarios para iniciar sesión"
            )

        return data

class CustomUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("email", "first_name", "last_name", "phone_number")


class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ("id", "email", "first_name", "last_name", "phone_number", "password")

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user


class UpdateUserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=False)
    phone_number = serializers.CharField(required=False)
    password = serializers.CharField(write_only=True, required=False)
    permissions = serializers.ListField(child=serializers.IntegerField(), required=False)

    class Meta:
        model = User
        fields = ("email", "first_name", "last_name", "phone_number", "password", "permissions")

    def validate(self, attrs):
        password = attrs.get('password')
        if password and len(password) < 6:
            raise serializers.ValidationError({'password': 'La contraseña debe tener al menos 6 caracteres.'})
        return attrs

    def update(self, instance, validated_data):
        password = validated_data.pop('password', None)
        permissions = validated_data.pop('permissions', None)
        
        if password:
            instance.set_password(password)
        if permissions is not None:
            instance.user_permissions.set(permissions)
        
        return super().update(instance, validated_data)


class PasswordSerializer(serializers.Serializer):
    password = serializers.CharField(max_length=128, min_length=6, write_only=True)
    password2 = serializers.CharField(max_length=128, min_length=6, write_only=True)

    def validate(self, data):
        if data["password"] != data["password2"]:
            raise serializers.ValidationError(
                {"password": "Debe ingresar ambas contraseñas iguales"}
            )
        return data


class UserListSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("id", "email", "first_name", "last_name", "phone_number")
