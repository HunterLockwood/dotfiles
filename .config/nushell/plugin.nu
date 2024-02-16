register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_formats`  {
  "sig": {
    "name": "from eml",
    "usage": "Parse text as .eml and create record.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "preview-body",
        "short": "b",
        "arg": "Int",
        "required": false,
        "desc": "How many bytes of the body to preview",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Record": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'From: test@email.com\nSubject: Welcome\nTo: someone@somewhere.com\nTest' | from eml",
      "description": "Convert eml structured data into record",
      "result": {
        "Record": {
          "val": {
            "cols": [
              "Subject",
              "From",
              "To",
              "Body"
            ],
            "vals": [
              {
                "String": {
                  "val": "Welcome",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Record": {
                  "val": {
                    "cols": [
                      "Name",
                      "Address"
                    ],
                    "vals": [
                      {
                        "Nothing": {
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      },
                      {
                        "String": {
                          "val": "test@email.com",
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Record": {
                  "val": {
                    "cols": [
                      "Name",
                      "Address"
                    ],
                    "vals": [
                      {
                        "Nothing": {
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      },
                      {
                        "String": {
                          "val": "someone@somewhere.com",
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "String": {
                  "val": "Test",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              }
            ]
          },
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    },
    {
      "example": "'From: test@email.com\nSubject: Welcome\nTo: someone@somewhere.com\nTest' | from eml -b 1",
      "description": "Convert eml structured data into record",
      "result": {
        "Record": {
          "val": {
            "cols": [
              "Subject",
              "From",
              "To",
              "Body"
            ],
            "vals": [
              {
                "String": {
                  "val": "Welcome",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Record": {
                  "val": {
                    "cols": [
                      "Name",
                      "Address"
                    ],
                    "vals": [
                      {
                        "Nothing": {
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      },
                      {
                        "String": {
                          "val": "test@email.com",
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Record": {
                  "val": {
                    "cols": [
                      "Name",
                      "Address"
                    ],
                    "vals": [
                      {
                        "Nothing": {
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      },
                      {
                        "String": {
                          "val": "someone@somewhere.com",
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "String": {
                  "val": "T",
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              }
            ]
          },
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_formats`  {
  "sig": {
    "name": "from ics",
    "usage": "Parse text as .ics and create table.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Table": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'BEGIN:VCALENDAR\n            END:VCALENDAR' | from ics",
      "description": "Converts ics formatted string to table",
      "result": {
        "List": {
          "vals": [
            {
              "Record": {
                "val": {
                  "cols": [
                    "properties",
                    "events",
                    "alarms",
                    "to-Dos",
                    "journals",
                    "free-busys",
                    "timezones"
                  ],
                  "vals": [
                    {
                      "List": {
                        "vals": [],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    },
                    {
                      "List": {
                        "vals": [],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    },
                    {
                      "List": {
                        "vals": [],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    },
                    {
                      "List": {
                        "vals": [],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    },
                    {
                      "List": {
                        "vals": [],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    },
                    {
                      "List": {
                        "vals": [],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    },
                    {
                      "List": {
                        "vals": [],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    }
                  ]
                },
                "internal_span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_formats`  {
  "sig": {
    "name": "from ini",
    "usage": "Parse text as .ini and create table.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Record": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'[foo]\na=1\nb=2' | from ini",
      "description": "Converts ini formatted string to record",
      "result": {
        "Record": {
          "val": {
            "cols": [
              "foo"
            ],
            "vals": [
              {
                "Record": {
                  "val": {
                    "cols": [
                      "a",
                      "b"
                    ],
                    "vals": [
                      {
                        "String": {
                          "val": "1",
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      },
                      {
                        "String": {
                          "val": "2",
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              }
            ]
          },
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_formats`  {
  "sig": {
    "name": "from vcf",
    "usage": "Parse text as .vcf and create table.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Table": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'BEGIN:VCARD\nN:Foo\nFN:Bar\nEMAIL:foo@bar.com\nEND:VCARD' | from vcf",
      "description": "Converts ics formatted string to table",
      "result": {
        "List": {
          "vals": [
            {
              "Record": {
                "val": {
                  "cols": [
                    "properties"
                  ],
                  "vals": [
                    {
                      "List": {
                        "vals": [
                          {
                            "Record": {
                              "val": {
                                "cols": [
                                  "name",
                                  "value",
                                  "params"
                                ],
                                "vals": [
                                  {
                                    "String": {
                                      "val": "N",
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  },
                                  {
                                    "String": {
                                      "val": "Foo",
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  },
                                  {
                                    "Nothing": {
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  }
                                ]
                              },
                              "internal_span": {
                                "start": 0,
                                "end": 0
                              }
                            }
                          },
                          {
                            "Record": {
                              "val": {
                                "cols": [
                                  "name",
                                  "value",
                                  "params"
                                ],
                                "vals": [
                                  {
                                    "String": {
                                      "val": "FN",
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  },
                                  {
                                    "String": {
                                      "val": "Bar",
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  },
                                  {
                                    "Nothing": {
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  }
                                ]
                              },
                              "internal_span": {
                                "start": 0,
                                "end": 0
                              }
                            }
                          },
                          {
                            "Record": {
                              "val": {
                                "cols": [
                                  "name",
                                  "value",
                                  "params"
                                ],
                                "vals": [
                                  {
                                    "String": {
                                      "val": "EMAIL",
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  },
                                  {
                                    "String": {
                                      "val": "foo@bar.com",
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  },
                                  {
                                    "Nothing": {
                                      "internal_span": {
                                        "start": 0,
                                        "end": 0
                                      }
                                    }
                                  }
                                ]
                              },
                              "internal_span": {
                                "start": 0,
                                "end": 0
                              }
                            }
                          }
                        ],
                        "internal_span": {
                          "start": 0,
                          "end": 0
                        }
                      }
                    }
                  ]
                },
                "internal_span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_plot`  {
  "sig": {
    "name": "hist",
    "usage": "Render an ASCII histogram from a list of values.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "width",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum width of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "height",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum height of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "title",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "Provide a title to the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bins",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The number of bins in the histogram, default is 20.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "legend",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "Plot a tiny, maybe useful legend.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bars",
        "short": "b",
        "arg": null,
        "required": false,
        "desc": "Change lines to bars.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "steps",
        "short": "s",
        "arg": null,
        "required": false,
        "desc": "Change lines to steps.",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_plot`  {
  "sig": {
    "name": "plot",
    "usage": "Render an ASCII plot from a list of values.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "width",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum width of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "height",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum height of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "title",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "Provide a title to the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "legend",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "Plot a tiny, maybe useful legend.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bars",
        "short": "b",
        "arg": null,
        "required": false,
        "desc": "Change lines to bars.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "steps",
        "short": "s",
        "arg": null,
        "required": false,
        "desc": "Change lines to steps.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "points",
        "short": "p",
        "arg": null,
        "required": false,
        "desc": "Change lines to points.",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_query`  {
  "sig": {
    "name": "query",
    "usage": "Show all the query commands",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_query`  {
  "sig": {
    "name": "query json",
    "usage": "execute json query on json file (open --raw <file> | query json 'query string')",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "query",
        "desc": "json query",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_query`  {
  "sig": {
    "name": "query web",
    "usage": "execute selector query on html/web",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "query",
        "short": "q",
        "arg": "String",
        "required": false,
        "desc": "selector query",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "as-html",
        "short": "m",
        "arg": null,
        "required": false,
        "desc": "return the query output as html",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "attribute",
        "short": "a",
        "arg": "String",
        "required": false,
        "desc": "downselect based on the given attribute",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "as-table",
        "short": "t",
        "arg": {
          "List": "String"
        },
        "required": false,
        "desc": "find table based on column header list",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "inspect",
        "short": "i",
        "arg": null,
        "required": false,
        "desc": "run in inspect mode to provide more information for determining column headers",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Network"
  },
  "examples": [
    {
      "example": "http get https://phoronix.com | query web --query 'header'",
      "description": "Retrieve all `<header>` elements from phoronix.com website",
      "result": null
    },
    {
      "example": "http get https://en.wikipedia.org/wiki/List_of_cities_in_India_by_population\n    | query web --as-table [Rank City 'Population(2011)[3]' 'Population(2001)[3][a]' 'State or union territory']",
      "description": "Retrieve a html table from Wikipedia and parse it into a nushell table using table headers as guides",
      "result": null
    },
    {
      "example": "http get https://www.nushell.sh | query web --query 'h2, h2 + p' | group 2 | each {rotate --ccw tagline description} | flatten",
      "description": "Pass multiple css selectors to extract several elements within single query, group the query results together and rotate them to create a table",
      "result": null
    },
    {
      "example": "http get https://example.org | query web --query a --attribute href",
      "description": "Retrieve a specific html attribute instead of the default text",
      "result": null
    }
  ]
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_query`  {
  "sig": {
    "name": "query xml",
    "usage": "execute xpath query on xml",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "query",
        "desc": "xpath query",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_str_similarity`  {
  "sig": {
    "name": "str similarity",
    "usage": "Compare strings to find similarity by algorithm",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "string",
        "desc": "String to compare with",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "normalize",
        "short": "n",
        "arg": null,
        "required": false,
        "desc": "Normalize the results between 0 and 1",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "list",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "List all available algorithms",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "algorithm",
        "short": "a",
        "arg": "String",
        "required": false,
        "desc": "Name of the algorithm to compute",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "all",
        "short": "A",
        "arg": null,
        "required": false,
        "desc": "Run all algorithms",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "'nutshell' | str similarity 'nushell'",
      "description": "Compare two strings for similarity",
      "result": null
    },
    {
      "example": "'nutshell' | str similarity -n 'nushell'",
      "description": "Compare two strings for similarity and normalize the output value",
      "result": null
    },
    {
      "example": "'nutshell' | str similarity 'nushell' -a levenshtein",
      "description": "Compare two strings for similarity using a specific algorithm",
      "result": null
    },
    {
      "example": "str similarity 'nu' --list",
      "description": "List all the included similarity algorithms",
      "result": null
    },
    {
      "example": "'nutshell' | str similarity 'nushell' -A",
      "description": "Compare two strings for similarity with all algorithms",
      "result": null
    },
    {
      "example": "'nutshell' | str similarity 'nushell' -A -n",
      "description": "Compare two strings for similarity with all algorithms and normalize the output value",
      "result": null
    }
  ]
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_units`  {
  "sig": {
    "name": "units",
    "usage": "Convert between units",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "category",
        "short": "c",
        "arg": "String",
        "required": true,
        "desc": "specify the category",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "unit",
        "short": "u",
        "arg": "String",
        "required": true,
        "desc": "specify the unit type",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "value",
        "short": "v",
        "arg": "Float",
        "required": true,
        "desc": "specify the value",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Generators"
  },
  "examples": []
}

register `/Users/hunterlockwood/Library/Application Support/nushell/plugins/nu_plugin_plot`  {
  "sig": {
    "name": "xyplot",
    "usage": "Render an ASCII xy plot from a list of values.",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "width",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum width of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "height",
        "short": null,
        "arg": "Number",
        "required": false,
        "desc": "The maximum height of the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "title",
        "short": "t",
        "arg": "String",
        "required": false,
        "desc": "Provide a title to the plot.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "legend",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "Plot a tiny, maybe useful legend.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "bars",
        "short": "b",
        "arg": null,
        "required": false,
        "desc": "Change lines to bars.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "steps",
        "short": "s",
        "arg": null,
        "required": false,
        "desc": "Change lines to steps.",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "points",
        "short": "p",
        "arg": null,
        "required": false,
        "desc": "Change lines to points.",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

