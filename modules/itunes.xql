xquery version "3.0";

import module namespace config="http://podlove.org/podlove-analyzer/config" at "config.xqm";

declare namespace psc="http://podlove.org/simple-chapters";
declare namespace fh="http://purl.org/syndication/history/1.0";
declare namespace feedburner="http://rssnamespace.org/feedburner/ext/1.0";
declare namespace itunes="http://www.itunes.com/dtds/podcast-1.0.dtd";
declare namespace atom="http://www.w3.org/2005/Atom";
declare namespace content="http://purl.org/rss/1.0/modules/content/";

declare option exist:serialize "method=text";


let $path-to-feeds := $config:app-root || "/../feed-data/data/feeds"
let $itunes-images := collection($path-to-feeds)//channel/itunes:image
let $text := <text>{for $image in $itunes-images return data($image/@href) || "&#xA;"}</text>
return 
    xmldb:store("/db", "images.txt",$text,"text")


