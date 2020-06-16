# importing the required packages from the django
from django.shortcuts import render
from django.utils.safestring import mark_safe
import json

# receving the request when calling for a home page
def index(request):
    return render(request, 'index.html', {})
    
def room(request, room_name):
    """
    Desc:Refering the room.html in chatroom and passing the room name
         which allows user to enter into room-name received.
    """
    return render(request, 'room.html', {
        'room_name_json': mark_safe(json.dumps(room_name))
    })
