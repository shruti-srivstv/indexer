# Indexer

This is a very simple application to parse and store the relevant content (links and headings) of a webpage. Two models are defined, page and content. The page model has only URL and ID of the page, and content has multiple records associated with the URL, and an attribute called content_type which shows whether it's a link or heading. Nokogiri is used to parse the HTML page.

The application has two APIs -

##To add the content of a new URL to the database

POST /pages
Body : "url" : *URL*
Response: "status" : "SUCCESS *or* FAILURE"

The url is sent as a key pair in the request body instead of the query string to avoid having to encode the URL.

##To show list of URLs stored

GET /pages
Response: "status" : "SUCCESS *or* FAILURE", "pages" : ["id" : 1, "url" : "www.sample_url.com"], 
"content" : {"www.sample_url.com" : ["content_type": "a", "data": "link data", "page_id": 1], ["content_type": "a", "data": "more_link data", "page_id": 1]}

The content stored in the database associated with the URLs is also sent as a part of the response, with the key as URL ID and value as an array of all the data associated with the URL.


##Edge cases and assumptions

1. If the content or website is not available, the URL is not stored in the database, and status is sent as FAILURE. Exception is not sent in the response but stored in the logs.
2. Duplicate URL are not handled
3. Content like timestamps are not sent in the response.
