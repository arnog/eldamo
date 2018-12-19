declare function local:list-references($sources as element()*) as node()* {
    for $source in $sources
    let $prefix := $source/@prefix/string()
    order by $source/@prefix/lower-case(.)
    return
    <li>
        <b>{$prefix}</b>:
        <i><a href="ref-{$prefix}.html">{$source/@name/string()}</a></i>
        {if ($source/cite) then '; ' else () } 
        {xdb:html($source/cite/string())}
    </li>
};

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta><meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"></meta>
<title>Eldamo : Reference Index</title>
<link type="text/css" rel="stylesheet" href="../../css/global.css" />
</head>
<body>
<p>[<a href="../../index.html">Home</a>]</p>
<hr/>
<h1>Reference Index</h1>
<p>Here is a list of abbreviations for the sources used in this lexicon, with links to citations for individual
sources.</p>
<h2>Primary Sources</h2>
<p>The following publications include primary source material, written by Tolkien himself.</p>
<ul> {
    local:list-references(/*/source[not(@type)])
} </ul>
<p><b>Major Works:</b></p>
<p>It is common in the literature to cite some of Tolkien’s major linguistic works directly by name rather than by the
source in which the text appear. This lexicon also follows this convention. The dates in the citations below are the
dates of probable composition.</p>
<ul> {
    local:list-references(/*/source[@type='work'])
} </ul>
<p><b>Minor Works:</b></p>
<p>The following are reference to minor or fragmentary works not appearing in other, larger documents (such as Elvish
quotes in inscriptions or letters), or works that contain only isolated Elvish samples.</p>
<ul> {
    local:list-references(/*/source[@type='minor-work'])
} </ul>
<p><b>Indices:</b></p>
<p>To avoid referencing every appearance of a proper name in a given primary source, this lexicon instead references its
entry in that source’s index. Proper names are only referenced directly in primary sources if its appearance
includes other important linguistic information, such as a translation or etymology of the name. The indices also
sometimes include linguistic information not available elsewhere.</p>
<ul> {
    local:list-references(/*/source[@type='index'])
} </ul>
<p><b>Appendices:</b></p>
<p>Some of the primary sources include large appendices of word lists compiled by Christopher Tolkien.
These are referenced separately from the main works.</p>
<ul> {
    local:list-references(/*/source[@type='appendix'])
} </ul>
<h2>Secondary Sources</h2>
<p>The following documents include analysis of primary material, but do not themselves include
original writing by Tolkien. Some are specific to particular languages, as noted below.</p>
<ul> {
    local:list-references(/*/source[@type='secondary'])
} </ul>
<p><b>Quenya:</b></p>
<ul> {
    local:list-references(/*/source[@type='quenya'])
} </ul>
<p><b>Sindarin:</b></p>
<ul> {
    local:list-references(/*/source[@type='sindarin'])
} </ul>
<p><b>Telerin:</b></p>
<ul> {
    local:list-references(/*/source[@type='telerin'])
} </ul>
<p><b>Minor Elvish Languages (Ilkorin, Danian and Others):</b></p>
<ul> {
    local:list-references(/*/source[@type='minor'])
} </ul>
<p><b>Adûnaic:</b></p>
<ul> {
    local:list-references(/*/source[@type='adunaic'])
} </ul>
<h2><a name="Neologisms"></a>Neologisms</h2>
<p>The following are some of the sources of the neologisms that appear in Eldamo. Not every neologism appearing in these
sources also appears in Eldamo, and vice versa. In general, neologisms in Eldamo are credited by creator rather than
source, but there are exceptions in the case of Neo-Eldarin authors with large bodies of work. Furthermore, some sources
don’t list the original creator, in which case Eldamo credits the source. Uncredited neologisms in Eldamo were either
created by me (Paul Strack) or have an unknown source.</p>
<ul> {
    local:list-references(/*/source[@type='neologisms'])
} </ul>
</body>
</html>
