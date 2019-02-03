var posts = gon.posts
$.each(posts,function(post){
var url = 'http://localhost:3000/posts/' + this.id
console.log(url);
clndrLink["#" + this.studied_at] = `href = ${url}`;
});
