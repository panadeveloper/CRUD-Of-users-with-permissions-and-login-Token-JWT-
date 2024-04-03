from rest_framework_simplejwt.tokens import OutstandingToken, BlacklistMixin
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from django.contrib.auth import logout as django_logout
from django.contrib.sessions.models import Session
from users.serializers import CustomTokenObtainPairSerializer, CustomUserSerializer
from rest_framework.permissions import IsAuthenticated
from datetime import datetime, timedelta
from rest_framework_simplejwt.tokens import AccessToken
from rest_framework_simplejwt.exceptions import InvalidToken

class Login(APIView):
    def post(self, request, *args, **kwargs):
        serializer = CustomTokenObtainPairSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data["user"]
        
        
        user_serializer = CustomUserSerializer(user)
        user_data = user_serializer.data

        
        access_token = AccessToken.for_user(user)
        access_token.set_exp(from_time=datetime.now() + timedelta(days=1))

        is_admin = user.is_staff

        return Response({
            "access_token": str(access_token),
            "user": user_data,
            "is_admin": is_admin,
            "message": "Inicio de sesión exitoso."
        }, status=status.HTTP_201_CREATED)

class Logout(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        access_token = request.headers.get('Authorization', '').split()[1]
        if not access_token:
            return Response({"error": "Token de acceso no proporcionado."}, status=status.HTTP_400_BAD_REQUEST)
        try:
            token = AccessToken(access_token)
            if token.payload["user_id"] != request.user.id:
                return Response({"error": "El token JWT no pertenece a este usuario."}, status=status.HTTP_400_BAD_REQUEST)
            
            Session.objects.filter(expire_date__gte=datetime.now(), session_key__contains=token.payload["user_id"]).delete()
            
            OutstandingToken.objects.filter(user=request.user).delete()
            django_logout(request)
            return Response({"message": "Cierre de sesión exitoso. Todas las sesiones han sido eliminadas y los tokens JWT pendientes han sido invalidados."}, status=status.HTTP_200_OK)
        except InvalidToken:
            return Response({"error": "Token JWT inválido o incorrecto."}, status=status.HTTP_400_BAD_REQUEST)
