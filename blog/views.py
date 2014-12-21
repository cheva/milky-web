from django.shortcuts import get_object_or_404, render
from blog.forms import *
from django.views import generic


class ListView(generic.ListView):
    model = Post
    template_name = "blog/list.jinja"

    def get_queryset(self):
        """Return the last five published questions."""
        return Post.objects.order_by('-created')[:5]


class DetailView(generic.DetailView):
    """Show post, associated comments and an 'add comment' form."""
    model = Post
    template_name = "blog/post.jinja"

    def get_context_data(self, **kwargs):
        context = super(DetailView, self).get_context_data(**kwargs)
        context['form'] = CommentForm
        return context


def post_comment(request, post_id):
    post = get_object_or_404(Post, pk=post_id)
    comment = Comment(author=request.POST['author'], body=request.POST['body'], post=post)
    if request.POST:
        modelform = CommentForm(request.POST)
        # Validate the form: the captcha field will automatically check the input
        if modelform.is_valid():
            comment.save()
        else:
            # form error
            error_message = "Form error!"
            return render(request, "blog/post.jinja", locals())
    else:
        # empty POST
        error_message = "Wrong request!"
        return render(request, "blog/post.jinja", locals())
        pass
    return HttpResponseRedirect(reverse('post', args=(post.id,)))