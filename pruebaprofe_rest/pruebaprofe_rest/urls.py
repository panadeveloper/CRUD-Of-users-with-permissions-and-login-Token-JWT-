from django.contrib import admin
from django.urls import path, include
from users.views import register_user, user_profile, create_user, view_user, list_user, update_user, delete_user
from users.login import Login, Logout

urlpatterns = [
    path("admin/", admin.site.urls),
    path("user_profile/", user_profile, name="user-profile"),
    path("create_user/", create_user, name="create-user"),
    path("register_user/", register_user, name="register-user"),
    path("view_user/<int:pk>/", view_user, name="view-user"),
    path("list_user/", list_user, name="list-user"),
    path("update_user/<int:pk>/", update_user, name="update-user"),
    path("delete_user/<int:pk>/", delete_user, name="delete-user"),
    path("login/", Login.as_view(), name="Login"),
    path("logout/", Logout.as_view(), name="Logout"),
]


    