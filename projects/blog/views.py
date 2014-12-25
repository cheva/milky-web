from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.shortcuts import redirect
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from projects.blog.forms import *


def list_view(request, page_num=1):
    """
    Post list view with comments count and paginator
    :param request:
    :return:
    """
    template = 'blog/list.jinja'
    post_list = Post.objects.order_by('-created')
    # paginator
    # @todo move it to helpers
    paginator = Paginator(post_list, 10)
    try:
        post_list = paginator.page(page_num)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        post_list = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        post_list = paginator.page(paginator.num_pages)
    return render(request, template, locals())


def detail_view(request, pk):
    """
    Post detail view with comment list and comment form
    :param request:
    :param pk:
    :return:
    """
    template = 'blog/post.jinja'
    post = get_object_or_404(Post, pk=pk)
    comment_list = Comment.objects.filter(post_id=pk).order_by('-created')
    form = CommentForm()
    return render(request, template, locals())


def post_comment(request, pk):
    """
    Add comment form controller with validators and errors output
    :param request:
    :param pk:
    :return:
    """
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
    return redirect(reverse('blog:post', args=(post.id,)))