import time
from calendar import month_name

from django.shortcuts import get_object_or_404, render
from blog.forms import *
from includes.mcbv.list import ListView
from includes.mcbv.list_custom import DetailListCreateView


class PostView(DetailListCreateView):
    """Show post, associated comments and an 'add comment' form."""
    detail_model = Post
    list_model = Comment
    modelform_class = CommentForm
    related_name = "comments"
    fk_attr = "post"
    template_name = "blog/post.jinja"


class Main(ListView):
    list_model = Post
    paginate_by = 10
    template_name = "blog/list.jinja"

    def months(self):
        """Make a list of months to show archive links."""
        if not Post.obj.count(): return list()

        # set up variables
        current_year, current_month = time.localtime()[:2]
        first = Post.obj.order_by("created")[0]
        first_year = first.created.year
        first_month = first.created.month
        months = list()

        # loop over years and months
        for year in range(current_year, first_year - 1, -1):
            start, end = 12, 0
            if year == current_year: start = current_month
            if year == first_year: end = first_month - 1

            for month in range(start, end, -1):
                if Post.obj.filter(created__year=year, created__month=month):
                    months.append((year, month, month_name[month]))
        return months


class ArchiveMonth(Main):
    paginate_by = None

    def get_list_queryset(self):
        year, month = self.args
        return Post.obj.filter(created__year=year, created__month=month).order_by("created")


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