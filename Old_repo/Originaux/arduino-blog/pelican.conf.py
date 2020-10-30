# -*- coding: utf-8 -*-
AUTHOR = u'Tero Koskinen'
SITENAME = u"Tero's Arduino Blog"
SITEURL = 'http://arduino.ada-language.com'
SITESUBTITLE = u"Using Arduino with Ada"

GITHUB_URL = ''
DISQUS_SITENAME = "terosarduinoblog"
PDF_GENERATOR = False
REVERSE_CATEGORY_ORDER = True
LOCALE = ""
DEFAULT_PAGINATION = 5
WITH_PAGINATION = True
DISPLAY_PAGES_ON_MENU = True
THEME = "arduino-theme"
TIMEZONE = "Europe/Helsinki"

FEED_RSS = 'feeds/all.rss.xml'
CATEGORY_FEED_RSS = 'feeds/%s.rss.xml'

LINKS = (
         ('Code Repositories', 'http://hg.stronglytyped.org'),
         ('AVR-Ada', 'http://sourceforge.net/projects/avr-ada'),
         ('Ahven', 'http://ahven.stronglytyped.org/'),
         )

SOCIAL = (('twitter', 'http://twitter.com/tkoskine'),
          ('identica', 'http://identi.ca/tkoskine'),
          ('bitbucket', 'https://bitbucket.org/tkoskine'),)

# global metadata to all the contents
DEFAULT_METADATA = ()

# static paths will be copied under the same name
STATIC_PATHS = ["pictures",]

# A list of files to copy from the source to the destination
# FILES_TO_COPY = (('extra/robots.txt', 'robots.txt'),
#                  ('extra/404.shtml','404.shtml'),)

LOCALE = ('usa', 'en_US' )
