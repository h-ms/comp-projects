
# DNS explained

[This video](https://youtu.be/72snZctFFtA) explains how DNS lookup works:
i.e., how a domain name is translated to an IP address.

                                                   
## Who knows what

The following list illustrates the lookup process for a given query (`www.example.com`)
if the IP address is not stored in the browser cache, operating system memory or in the
resolving name server's cache.

+   because of the dot (implied) at the end of the domain name (`www.example.com.`),
    the resolving name server knows it should ask the root name server
    
+   based on the name in the top-level of the domain name (e.g.,`com`), 
    the root name server knows which top-level domain (TLD) name server to ask 
    (namely, the `.com` server)
    
+   based on the name before the top-level (`example`) and the information passed on
    by the domain registrar, the TLD name server knows which authoritative name server to ask
    
+   the authoritative name server will provide the IP address (for `www.example.com`)

All the while, the resolving name server stores information given to it by the respective name servers
in its cache.





                                                   