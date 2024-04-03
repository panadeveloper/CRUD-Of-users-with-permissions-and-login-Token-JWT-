from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager, Permission
from django.contrib.auth.hashers import make_password
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.conf import settings
from django.contrib.contenttypes.models import ContentType


class UserManager(BaseUserManager):
    
    def create_user(self, email, first_name, last_name, phone_number, password=None, is_active=True, **extra_fields):
        if not email:
            raise ValueError('El campo Email debe estar configurado')
        email = self.normalize_email(email)
        user = self.model(
            email=email,
            first_name=first_name,
            last_name=last_name,
            phone_number=phone_number,
            is_active=is_active,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    
    def create_superuser(self, email, first_name, last_name, phone_number, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)  
        return self.create_user(email, first_name, last_name, phone_number, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField('Email', unique=True)
    first_name = models.CharField('First Name', max_length=255, blank=True, null=True)
    last_name = models.CharField('Last Name', max_length=255, blank=True, null=True)
    phone_number = models.CharField('Phone Number', max_length=20)
    is_active = models.BooleanField('Is Active', default=True)
    is_staff = models.BooleanField(default=False)
    jwt_token = models.CharField('JWT Token', max_length=255, null=True, blank=True)

    objects = UserManager()

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "Users"

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name', 'phone_number']

    def __str__(self):
        return self.email

@receiver(pre_save, sender=settings.AUTH_USER_MODEL)
def encrypt_password(sender, instance, **kwargs):
    if instance._state.adding: 
        instance.password = make_password(instance.password)


content_type = ContentType.objects.get_for_model(User)

if not Permission.objects.filter(codename='view_user').exists():
    can_view_user = Permission.objects.create(
        codename='view_user',
        name='Can view User',
        content_type=content_type,
    )

if not Permission.objects.filter(codename='change_user').exists():
    can_change_user = Permission.objects.create(
        codename='change_user',
        name='Can change User',
        content_type=content_type,
    )

if not Permission.objects.filter(codename='delete_user').exists():
    can_delete_user = Permission.objects.create(
        codename='delete_user',
        name='Can delete User',
        content_type=content_type,
    )
