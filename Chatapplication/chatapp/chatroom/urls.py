# Importng the path module from the django 
from django.urls import path, re_path
# Importing the views to acess the functions.
from .views import index, room
urlpatterns = [
    # keeping the first '' empty because it refers to the home
    # calling the home page in views class in chat rooom app
    path('', index, name='index'),
    re_path(r'^(?P<room_name>[^/]+)/$', room, name='room')
    # path('home', home, name='home'),
    # Receving the room name as a request from the project urls and
    #  refering to the room function in the views.
    # re_path('<str:room_name>/', room, name='room'),

]
