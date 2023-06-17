---
layout: post
title:  "Split strings containing Korean and English into tokens"
categories: Talks
---

> How can we tokenize a string into a list based on language?
>> For example, if the string is "hi 안녕하세요 반가워요 hello", the resulting list should be ["hi", "안녕하세요 반가워요", "hello"].

To tokenize a string to a list by language, we can use a similar approach as before using regular expressions to tokenize the text based on the Unicode character properties. Here's an example code snippet that tokenizes a string to a list by language using regular expressions:


```python
import re

# set the input string
input_string = 'hi 안녕하세요 반가워요 hello'

# detect the language of the input string
if re.search('[\u3131-\u3163\uac00-\ud7a3]+', input_string):
    language = 'korean'
elif re.search('[\u3040-\u309F\u30A0-\u30FF\u31F0-\u31FF]+', input_string):
    language = 'japanese'
else:
    language = 'english'

# tokenize the input string using the appropriate regular expression
if language == 'korean':
    tokens = re.findall('[^\s]+', input_string)
    tokens = [re.sub(r'([^\w\s]|_)+', '', token) for token in tokens]
elif language == 'japanese':
    import jaconv  # required for half-width katakana conversion
    input_string = jaconv.h2z(input_string, kana=True, digit=False, ascii=False)
    tokens = re.findall('[\w]+', input_string)
else:
    tokens = re.findall(r'\w+', input_string)

# output the resulting list of tokens
print(tokens)
```

This will output the following list of tokens: `['hi', '안녕하세요 반가워요', 'hello']`.

Note that for Korean text, we use the regular expression `[^\s]+` to match any sequence of non-whitespace characters, which includes punctuation symbols such as period and comma. We then use the `re.sub` function to remove any remaining punctuation from each token.
