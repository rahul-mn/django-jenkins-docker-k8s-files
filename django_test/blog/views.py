from django.shortcuts import render
from .models import Post
posts = [
    {
        'Author': 'rahul',
        'Title': 'blog 1st Post 1',
        'content': 'content of 1st post 1',
        'date_posted': 'oct 27, 2021'
    },
    {
        'Author': 'testuser',
        'Title': 'blog 1st Post 2',
        'content': 'content of 1st post 2',
        'date_posted': 'oct 28, 2021'
    }
]

def home(request):
    context = {
        'posts': Post.objects.all()
    }
    return render(request, 'blog/home.html', context)

def about(request):
    return render(request, 'blog/about.html', {'Title': 'About'})