import module namespace c = "common.xq" at "common.xq";

declare variable $pubmode external;
declare variable $lang-cats := /*/language-cat;

declare function local:show-language($lang as element()) as element() {
    <li> { (
        if ($lang/@id) then (
            <a href="../language-pages/lang-{$lang/@id}.html"><b>{$lang/@name/string()}</b></a>,
            concat(' (', normalize-space(c:convert-lang(string($lang/@id))), ')')
        ) else (
            <b><i>{$lang/@name/string()}</i></b>
        ),
        if (not($lang/language)) then () else
        <ul> {
            for $child in $lang/language return local:show-language($child)
        } </ul>
    ) } </li>
};

declare function local:has-lang($lang as xs:string?) as xs:boolean {
    if ($lang-cats//language[@id = $lang]) then (true()) else false()
};

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta><meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"></meta>
<title>Eldamo : Language Index</title>
<link type="text/css" rel="stylesheet" href="../../css/global.css" />
</head>
<body>
<p>[<a href="../../index.html">Home</a>]</p>
<hr/>
<h1>Language Index</h1>
<ul> {
for $lang-cat in /*/language-cat
return
<li><b><a href="#{$lang-cat/@id/string()}">{$lang-cat/@name/string()}</a></b></li>
} </ul>
<p>This page lists the languages included in this lexicon, broken down into various time periods. Within each period,
languages are arranged hierarchically by descent: child languages that were derived from more ancient languages.</p>
<p>The “Combined” or “Neo” languages assemble words from various periods, including fan creations (neologisms). These
“Combined” lists are most useful for new Elvish writing. Be cautious using these collections of words, however, since
they mix words from various periods. The time period of each word is indicated by its language marker, and there are
various other “<a href="../../general/terminology-and-notations.html#reliability-markers">reliability markers</a>” that
can be used a guide for the level of quality of each word.</p>
<p>The other languages are present as Tolkien described them in various periods of his life: Early (1910-1930), Middle
(1930-1950) and Late (1950-1973). They include only those forms that Tolkien wrote in that particular period. Bear in
mind, though, that Tolkien frequently used early forms in his later writings. Even if a particular early form did not
appear, this does not necessarily mean Tolkien no longer considered it valid. Where possible, this lexicon tries to
trace the conceptual evolution of individual words in Tolkien’s writing.</p>
<div> {
for $lang-cat in /*/language-cat
return (
<p><b><u><a name="{$lang-cat/@id/string()}"></a>{$lang-cat/@name/string()}</u></b></p>,
<ul> {
for $lang in $lang-cat/language|$lang-cat/language-cat
return
    local:show-language($lang)
} </ul>
) } </div>

<div> {
let $unex-langs := distinct-values(//word/@l)
let $lang-list := (
<ul> {
for $unex-lang in $unex-langs[not(local:has-lang(.))][$pubmode != 'true']
return (
    <li>{ $unex-lang }</li>
) } </ul>
)
return if (normalize-space($lang-list) = '') then () else (
    <p><b>Unexplained Languages</b></p>,
    $lang-list
) } </div>
</body>
</html>
