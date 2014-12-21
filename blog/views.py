from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.shortcuts import redirect
from django.core.urlresolvers import reverse
from blog.forms import *


def list_view(request):
    template = 'blog/list.jinja'
    post_list = Post.objects.order_by('-created')[:10]
    context = {'post_list': post_list}
    return render(request, template, locals())


def detail_view(request, pk):
    template = 'blog/post.jinja'
    post = get_object_or_404(Post, pk=pk)
    comment_list = Comment.objects.order_by('-created')
    form = CommentForm()
    return render(request, template, locals())


def post_comment(request, pk):
    template = 'blog/post.jinja'
    post = get_object_or_404(Post, pk=pk)
    comment = Comment(author=request.POST['author'], body=request.POST['body'], post=post)
    if request.POST:
        form = CommentForm(request.POST)
        # Validate the form: the captcha field will automatically check the input
        if form.is_valid():
            comment.save()
        else:
            # form error
            error_message = "Form error!"
            return render(request, template, locals())
    else:
        # empty POST
        error_message = "Wrong request!"
        return render(request, template, locals())
        pass
    return redirect(reverse('post', args=(post.id,)))