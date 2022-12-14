# E-Commerce Selector 

**Custom Variable Template for Google Tag Manager**

Finds specific ecommerce push to dataLayer by ecom type (UA) or event name (GA4) 

![Template Status](https://img.shields.io/badge/Community%20Template%20Gallery%20Status-submitted-orange) ![Repo Size](https://img.shields.io/github/repo-size/mbaersch/ecommerce-selector) ![License](https://img.shields.io/github/license/mbaersch/ecommerce-selector)

---

## Usage
Define a UA ecommerce event type like "detail" or "add" to find the last push to the existing dataLayer. Optionally define an event name to specify the desired dataLayer push like "view_item" for a GA4 ecommerce event. Returns the "ecommerce" object if found. 

### Object Refinement
Optionally define a list of keys to delete from the result object. A second list allows to add new keys to the result or overwrite existing keys with new values. 
