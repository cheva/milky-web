from django.db.models import *
from django.core.mail import send_mail

notify = False


class Post(Model):
	title = CharField(max_length=60)
	alias = CharField(max_length=60,null=True)
	image = ImageField(width_field=900,height_field=300,null=True)
	body = TextField()
	created = DateTimeField(auto_now_add=True)
	show = BooleanField(default=True)

	class Meta:
		ordering = ["-created"]

	def __unicode__(self):
		return self.title


class Tag(Model):
	title = CharField(max_length=60)
	alias = CharField(max_length=60,null=True)
	count = IntegerField(default=0)
	posts = ManyToManyField(Post)
	
	def __unicode__(self):
		return self.title


class Comment(Model):
	author = CharField(max_length=60)
	body = TextField()
	post = ForeignKey(Post, related_name="comments")
	created = DateTimeField(auto_now_add=True)

	def __unicode__(self):
		return u"%s: %s" % (self.post, self.body[:60])

	def save(self, *args, **kwargs):
		"""Email when a comment is added."""
		if notify:
			tpl = "Comment was was added to '%s' by '%s': \n\n%s"
			message = tpl % (self.post, self.author, self.body)
			from_addr = "no-reply@mydomain.com"
			recipient_list = ["myemail@mydomain.com"]
			send_mail("New comment added", message, from_addr, recipient_list)
		super(Comment, self).save(*args, **kwargs)