# How to make a Complete Hash of Privacy

## 2012/02/13 11:08

The fallout from Path continues...

> At Mr. Morin's last job at Facebook, his boss Mark Zuckerberg apologized 
> publicly more than 10 times for privacy breaches.
> 
> It seems the management philosophy of "ask for forgiveness, not 
> permission" is becoming the "industry best practice." And based on the 
> response to Mr. Morin, tech executives are even lauded for it.  
> -- [Anger for Path Social Network After Privacy Breach - NYTimes.com][1]

Meanwhile here's Dare Obasanjo of Microsoft on how *they* store emails (the right way)...

> Instead of returning email addresses of a user's contacts from our APIs, 
> we provide email hashes instead. That way applications don't need to 
> store or match against actual email addresses of our users but can still 
> get all the value of providing a user with the a way to find their 
> Hotmail or Messenger contacts who also use that service.
> 
> We also provide code samples that show how to work with these hashes and 
> I remember being in discussions with folks on the team as to whether 
> developers would ever want to do this since storing and comparing email 
> addresses is less code than working with hashes. Our conclusion was that 
> it would be just a matter of time before this would be an industry best 
> practice and it was best if we were ahead of the curve. It will be 
> interesting to see if our industry learns from this experience or 
> whether it will take external pressure.  
> -- [Dare Obasanjo aka Carnage4Life - Address Book Privacy and Hashing][2]

Hashing is Fast. *Negligibly Fast*. I'm not entirely sure what the 'extra 
code' Dare refers to would be and whether it would really warrant much 
discussion, but this is absolutely the right way to go. Hashes have 
applications other than security. I uses hashes in [Pixenate][3] to 
optimize image editing operations. My point is this: Hashing isn't 
rocket science, it can be used by regular developers (like me). It 
offers a fast way to uniquely identify any piece of information using a 
128-bit identifier which **can't be reversed** so there is no way to 
decipher the email address from its hash.

I can't help wondering if Dave Morin (formerly of Facebook's 
API/Developer program) knew hashing would be the better approach but 
disingenuously decided to store the actual email addresses anyway. 

This is a (md5) hash of my email address: 81c5822a75fe1e4737683f998a29076f
It would have been all Path needed to uniquely identify me so that were 
I ever to actually sign up to their service, it could suggest the 
friends who had me in their address book. Dave I'm sure is a smart 
developer who was well aware of hashes (MD5 etc) but still decided not 
to use them; To store the emails themselves rather than their anonymized 
hashes. Why was that?

## Related 

[Hashing for privacy in social apps - Matt Gemmell][4]

[1]: http://bits.blogs.nytimes.com/2012/02/12/disruptions-so-many-apologies-so-much-data-mining/
[2]: http://www.25hoursaday.com/weblog/2012/02/12/SomeThoughtsOnAddressBookPrivacyAndHashingAsAnAlternativeToGatheringRawEmailAddresses.aspx
[3]: http://pixenate.com
[4]: http://mattgemmell.com/2012/02/11/hashing-for-privacy-in-social-apps/

## Categories

Security, Privacy, Path
