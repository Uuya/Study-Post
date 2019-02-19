var posts = gon.posts
$.each(posts,function(post){
var url = 'http://localhost:3000/posts/' + this.id
clndrLink["#" + this.learning_date] = `href = ${url}`;
});
