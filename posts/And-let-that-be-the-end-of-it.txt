# ...And let that be the end of it.

## 2012/02/09 10:38

Path have an iPhone app that's been secretly uploading user's address 
books to Path.com's servers. That means your personal details could have 
been uploaded even if you're not a Path App user. Do you have friends 
with iPhones? If they've installed Path, chances are your details were 
uploaded. This affects everyone, not just Path users but anyone in their 
address book. It is by all accounts a massive breach of privacy. 

Path are to blame here but so too are Apple for [enabling this kind of 
behavior in their APIs without requiring permission from Users][3]. At least 
with Android Apps, you are prompted with a list of features the App will 
require (e.g. access to address book etc, network comms etc) before you 
install the App. (This is also why I rarely install apps on my android 
phone - If an App requires address book access, it doesn't get 
installed). 

[John Gruber][1] has for a long time trumpeted the superiority of 
Apple's curated app store and its vetting over Android's non-curated 
bazaar. His reporting of the Path story is perfunctory. He is muted on 
Apple's role in this fiasco (as you would expect from Apple's unofficial 
PR dept). In his [Path makes things right][2] post he says Morin's statement is a 
"Perfect Response". Full Stop. I won't hold my breath waiting for Gruber to 
criticize Apple's role in this.

One of the most level-headed and honest commentaries has been from iOS 
developer Marco Arment who rightly calls out Apple on this...

> But Apple can, and should, assure users that no app can read their 
> contact data without their knowledge and explicit permission. I don't 
> know why this hasn't always been required, but it probably isn't a good 
> enough reason to justify the erosion of user trust in iOS apps that this 
> could cause.
> 
> Apple needs to change the Address Book API to require user permission 
> first, like Core Location and Push Notifications do. I don't care how 
> many applications break as a result. Not requiring user permission to 
> date should be treated as a security hole and patched promptly.  
> -- [iOS Address Book access should prompt the user for permission][4]

This is exactly what Apple need to do. Follow Android's lead.
Update: A mealy-mouthed admission that Apple should do something about this...

> I understand that Apple doesn't want us to be badgered by too many 
> permission-granting alerts, but address book data is sensitive enough to 
> warrant it, in my opinion. Why not treat it like they do location data?  
> -- [Daring Fireball ~ Stealing your address book][5]

[1]: http://daringfireball.net/
[2]: http://daringfireball.net/linked/2012/02/08/path-right
[3]: http://dcurt.is/stealing-your-address-book
[4]: http://www.marco.org/2012/02/09/ios-address-book-should-prompt-users
[5]: http://daringfireball.net/linked/2012/02/09/stealing-your-address-book

## Categories
Apple, Security, Android
