import http.requests.*;


GetRequest get = new GetRequest("http://soundcloud.com/oembed?url=http%3A//soundcloud.com/forss/flickermood&format=json");
get.send();
println("Reponse Content: " + get.getContent());
println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));