___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "E-Commerce Selector",
  "categories": [
    "UTILITY"
  ],
  "description": "Finds last push to dataLayer with a specific ecommerce  event (UA or GA4). Optionally edit or remove keys",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "pushType",
    "displayName": "Datalayer Event Type",
    "simpleValueType": true,
    "help": "Define a UA ecommerce event like \"detail\" or GA4 event like \"view_item\" with ecommerce key to extract from dataLayer",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "removeKeys",
    "displayName": "Remove Object Keys",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key Name",
        "name": "keyName",
        "type": "TEXT"
      }
    ],
    "help": "Keys to remove from result object"
  },
  {
    "type": "PARAM_TABLE",
    "name": "editKeys",
    "displayName": "Add / Edit Values",
    "paramTableColumns": [
      {
        "param": {
          "type": "TEXT",
          "name": "keyName",
          "displayName": "",
          "simpleValueType": true
        },
        "isUnique": true
      },
      {
        "param": {
          "type": "TEXT",
          "name": "value",
          "displayName": "",
          "simpleValueType": true
        },
        "isUnique": false
      }
    ],
    "help": "Add new keys or edit existing key values"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const Object = require('Object');
const tp = data.pushType;
const dl = copyFromWindow('dataLayer');

if (!dl || !tp || tp == "") return;  
var foundIndex = -1;  
for (var i = dl.length-1; i >= 0; i--){   
  var el = dl[i];  
  if (el && el.hasOwnProperty('ecommerce') && (el.ecommerce.hasOwnProperty(tp) || el.event === tp)) {  
    foundIndex = i;  
    break;  
  }   
}  

if (foundIndex >= 0) {
  var rs = dl[foundIndex].ecommerce;
  data.removeKeys.forEach(rmk => {
    Object.delete(rs, rmk.keyName);
  });
  data.editKeys.forEach(edk => {
    rs[edk.keyName] = edk.value;
  });
  
  return rs;
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 24.8.2022, 23:51:08
