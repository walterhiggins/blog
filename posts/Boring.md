# Boring 
## 2018/05/21 11:29

Some recent reading...


> There is perhaps one good argument for using Docker. It is hidden by the 
> many bad arguments for using Docker. I'm going to try to explain why so 
> much Docker rhetoric is stupid, and then look at what reason might be good.
> 
> [Docker is the dangerous gamble which we will regret][docker-danger]

Sometimes boring is better...

> What do Docker, CoreOS, and ECS have in common? All three are relatively 
> new technologies. Some might even call them "bleeding edge" (I won't). 
> In any case, all three are the opposite of boring - they're rather hip 
> and shiny. The point of this article is that, when it comes to 
> technology, sometimes boring is actually better.
> 
> [Sometimes Boring is Better][boring-better]

... and choose boring technology

> If you choose to write your website in NodeJS, you just spent one of 
> your innovation tokens. If you choose to use MongoDB, you just spent one 
> of your innovation tokens. If you choose to use service discovery tech 
> that's existed for a year or less, you just spent one of your innovation 
> tokens. If you choose to write your own database, oh god, you're in trouble.
> 
> [Choose Boring Technology][boring-tech]


Ship Small Diffs

> I'll make the case for one practice that works very well operationally: 
> deploying small units of code to production on a regular basis. I think 
> that your deploys should be measured in dozens of lines of code rather 
> than hundreds.
> 
> [Ship Small Diffs][ship-small]

Docker in Production: A history of failure

> The docker adoption started with minor new services. At first, 
> everything worked fine in dev, in testing and in production. The kernel 
> panics slowly began to happen as more web services and web applications 
> were dockerized. The stability issues became more prominent and 
> impactful as we grew.
> 
> [Docker in Production: A history of failure][docker-fail]

Is Kubernetes too complicated?

> Like a lot of other tech that has ostensibly come out of google, it will 
> likely have at least one major source of complexity that 95% of people 
> do not need and will not want. I've not gone looking for a custom 
> implementation of http/2 with a broken congestion window, but maybe one 
> will turn up.
> 
> Many of the problems that Kubernetes provides abstractions for, as 
> opposed to solutions for, will age gracelessly as consensus grows on how 
> to approach them. The balkanization of cluster management systems will 
> fade as consensus solves by convention what is currently open to experimentation.
> 
> [Is Kubernetes too complicated?][k8s-2]

[k8s-2]: http://jmoiron.net/blog/is-k8s-too-complicated/
[docker-fail]: https://thehftguy.com/2016/11/01/docker-in-production-an-history-of-failure/
[ship-small]: https://blog.skyliner.io/ship-small-diffs-741308bec0d1
[boring-tech]: http://mcfunley.com/choose-boring-technology
[boring-better]: https://medium.com/production-ready/sometimes-boring-is-better-d16d38214186
[docker-danger]: http://www.smashcompany.com/technology/docker-is-a-dangerous-gamble-which-we-will-regret

## Categories
Technology, Docker