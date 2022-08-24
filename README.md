# E-Commerce Selector (ecommerce-selector)
Custom Variable Template for for Google Tag Manager. Finds specific ecommerce push to dataLayer by ecom type (UA) or event name (GA4) 

## Usage
Define a UA ecommerce event type like "detail" or "add" to find the last push to the existing dataLayer. Optionally define an event name to specify the desired dataLayer push. Returns the "ecommerce" object if found. 

### Object Refinement
Optionally define a list of keys to delete from the result object. A second list allows to add new keys to the result or overwrite existing keys with new values. 