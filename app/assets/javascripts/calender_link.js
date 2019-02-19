var posts = gon.posts
$.each(posts,function(post){
var url = 'https://study-post.herokuapp.com/posts/' + this.id
clndrLink["#" + this.learning_date] = `href = ${url}`;
});
