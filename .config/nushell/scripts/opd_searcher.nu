#!/usr/bin/env -S nu --stdin
# # # # # # # # # # # # # # # # # # # # # # # # #
# OPD basic search passes `type` and `q` params:
## `type` is either `ojibwe` or `english`
## `q` is the user query
#const OPD_TYPE = [
#   {type:ojibwe},
#   {type:english}
#]
#
# here's an example search url:
# https://ojibwe.lib.umn.edu/search?q=($QUERY??)&type=($OPD_TYPE)
const OPD_BASE_URL = "https://ojibwe.lib.umn.edu/search?type=english&q="


 
# Conduct a Basic Search of the Ojibwe People's Dictionary for an English keyword. Users may input multiple words as part of a single query, like "by hand".
export def "opd" [...searchterms: string] {
    let query = ($searchterms | str join +)
    http get ($OPD_BASE_URL + $query) | query web --query 'div.keyword-group, div.english-search-main-entry:first-of-type > span.main-entry-title:first-child > span.lemma:first-of-type'
}


 
# OPD advanced search passes `type`, `field`, `scope`, and `q` params, where field depends on type.
# `type` + `field` have the following possible values:
#     - `word_part`+`form` (search Ojibwe components
#     - `main_entry`+{`lemma`,`stem`}  (search Ojibwe words
#     - `keyword`+`keyword` (search English glosses
# `scope` {contains,exact}
# `q`
const OPD_ADV_TYPE = [
    {type:"word_part",field:"form"},
    {type:"main_entry",field:"lemma"},
    {type:"keyword",field:"keyword"}
]
#
# Here's an example search:
# https://ojibwe.lib.umn.edu/advanced_search?type=($OPD_ADV_TYPE.type)&field=($OPD_ADV_TYPE.field)&scope=($OPD_ADV_SCOPE)&q=($QUERY??)



const OPD_ADV_BASE_URL = "https://ojibwe.lib.umn.edu/advanced_search?"
const OPD_ADV_SCOPE = [
    {scope:"exact"},
    {scope:"contains"},
    {scope:"ends_with"},
    {scope:"starts_with"}
]

# Perform an Advanced Search of the Ojibwe People's Dictionary for an Ojibwe component (morphemes/word parts). By default, this will only return exact matches.
export def "opd components" [
    searchterm: string
    --contains (-c) # Changes the `scope` parameter from `exact` to `contains`.
] {
    if $contains {
        http get ($OPD_ADV_BASE_URL + ($OPD_ADV_TYPE.0 | merge $OPD_ADV_SCOPE.1 | merge {q:$searchterm} | url build-query)) | query web --query '.word-part-search-result'
    } else {
        http get ($OPD_ADV_BASE_URL + ($OPD_ADV_TYPE.0 | merge $OPD_ADV_SCOPE.0 | merge {q:$searchterm} | url build-query)) | query web --query '.word-part-search-result'
    }
#   if $contains {
#        http get ($OPD_ADV_BASE_URL | str join $OPD_ADV_TYPE.0) | merge $OPD_ADV_SCOPE.1 | merge {q:$searchterm} | url build-query)
#        | query web --query '.word-part-search-result'
#    } else {
#        http get ($OPD_ADV_BASE_URL | str join $OPD_ADV_TYPE.0) | merge $OPD_ADV_SCOPE.0 | merge {q:$searchterm} | url build-query) 
#        | query web --query '.word-part-search-result'
#    }
}

### default ojibwe search: $OPD_ADV_TYPE.1 | merge $OPD_ADV_SCOPE.1
#export def words []
### ojibwe search-by-final: $OPD_ADV_TYPE.1 | merge $OPD_ADV_SCOPE.2
#export def endswith []

