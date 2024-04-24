from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from users.models import User
from users.serializers import UpdateUserSerializer, UserSerializer
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import Permission
from django.contrib.auth.hashers import make_password
from rest_framework_simplejwt.tokens import AccessToken
from django.contrib.auth import authenticate
from users.models import UserManager 
from django.db import transaction

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def view_user(request, pk):
    if not request.user.has_perm('users.view_user'):
        return Response("El usuario no cuenta con los permisos necesarios para llevar a cabo estas funciones u operaciones.!", status=status.HTTP_403_FORBIDDEN)
    
    user = User.objects.get(pk=pk)
    serializer = UserSerializer(user)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def list_user(request):
    if not request.user.has_perm('users.view_user'):
        return Response("El usuario no cuenta con los permisos necesarios para llevar a cabo estas funciones u operaciones.!", status=status.HTTP_403_FORBIDDEN)
    
    users = User.objects.all()
    serializer = UserSerializer(users, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def create_user(request):
    user_serializer = UserSerializer(data=request.data)
    if user_serializer.is_valid():
        user = user_serializer.save(is_active=True)
        user.set_password(request.data.get('password'))
        user.save()
        user_data = user_serializer.data
        
        return Response({
            "message": "Usuario registrado con éxito",
            "user": user_data,
        }, status=status.HTTP_201_CREATED)
    return Response({"message": "El usuario no se pudo registrar.", "errors": user_serializer.errors}, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def register_user(request):
    if not request.user.has_perm('users.add_user'):
        return Response("El usuario no cuenta con los permisos necesarios para llevar a cabo estas funciones u operaciones.", status=status.HTTP_403_FORBIDDEN)
    
    if not request.user.has_perm('users.add_user'):
        return Response("El usuario autenticado no tiene permisos para agregar usuarios.", status=status.HTTP_403_FORBIDDEN)
    
    if request.user.user_permissions.count() >= 4:
        return Response("Se ha alcanzado el límite de 4 privilegios para este usuario.", status=status.HTTP_400_BAD_REQUEST)
    
    user_serializer = UserSerializer(data=request.data)
    if user_serializer.is_valid():
        user = user_serializer.save(is_active=True)
        user.set_password(request.data.get('password'))
        user.save()
        user_data = user_serializer.data
        
        permissions_data = request.data.get('permissions', []) 
        
        permissions = Permission.objects.filter(id__in=permissions_data)
        user.user_permissions.set(permissions)
        
        return Response({
            "message": "Usuario registrado con éxito",
            "user": user_data,
        }, status=status.HTTP_201_CREATED)
    return Response({"message": "El usuario no se pudo registrar.", "errors": user_serializer.errors}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_profile(request):
    user = request.user
    user_serializer = UserSerializer(user)
    permissions = user.get_all_permissions()
    permission_names = [perm.split('.')[1] for perm in permissions]
    return Response({"user": UserSerializer(user).data, "permissions": permission_names}, status=status.HTTP_200_OK)
    return Response(user_serializer.data, status=status.HTTP_200_OK)
    if not permissions:
        return Response("El usuario no tiene permisos registrados", status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['PUT'])
@permission_classes([IsAuthenticated])
def update_user(request, pk):
    if not request.user.has_perm('users.change_user'):
        return Response("El usuario no cuenta con los permisos necesarios para llevar a cabo estas funciones u operaciones.!", status=status.HTTP_403_FORBIDDEN)
    
    user = User.objects.get(pk=pk)
    serializer = UpdateUserSerializer(user, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete_user(request, pk):
    if not request.user.has_perm('users.delete_user'):
        return Response("El usuario no cuenta con los permisos necesarios para llevar a cabo estas funciones u operaciones.!", status=status.HTTP_403_FORBIDDEN)
    
    user = get_object_or_404(User, pk=pk)
    user.delete()
    return Response({'message': 'Usuario eliminado con éxito.'}, status=status.HTTP_200_OK)




