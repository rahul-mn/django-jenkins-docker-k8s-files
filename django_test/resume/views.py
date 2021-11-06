from django.shortcuts import render
from django.http import HttpResponse

def home(request):
    return HttpResponse('<h1> Resume Home Page</h1>')

def about(request):
    return HttpResponse('<h1> About Page</h1>')