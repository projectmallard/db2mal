<?xml version='1.0' encoding='UTF-8'?><!-- -*- indent-tabs-mode: nil -*- -->
<!--
This program is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
details.

You should have received a copy of the GNU Lesser General Public License
along with this program; see the file COPYING.LGPL.  If not, see
<http://www.gnu.org/licenses/>.
-->
<!--
<!ENTITY % selectors SYSTEM "/usr/share/yelp-xsl/xslt/docbook/common/db-selectors.mod">
-->
<!DOCTYPE xsl:stylesheet [
<!ENTITY % selectors SYSTEM "db-selectors.mod">
%selectors;
]>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                xmlns:mml="http://www.w3.org/1998/Math/MathML"
                xmlns:db="http://docbook.org/ns/docbook"
                xmlns:mal="http://projectmallard.org/1.0/"
                xmlns="http://projectmallard.org/1.0/"
                exclude-result-prefixes="db mal mml"
                extension-element-prefixes="exsl"
                version="1.0">

<!-- FIXME: Had to make changes to db-common.xsl. Switch to db-common.xsl
     and db-selectors.mod from yelp-xsl after 3.20 is released. -->
<xsl:import href="db-common.xsl"/>
<xsl:import href="/usr/share/yelp-xsl/xslt/docbook/common/db-chunk.xsl"/>

<xsl:include href="db2mal-block.xsl"/>
<xsl:include href="db2mal-common.xsl"/>
<xsl:include href="db2mal-info.xsl"/>
<xsl:include href="db2mal-inline.xsl"/>
<xsl:include href="db2mal-list.xsl"/>
<xsl:include href="db2mal-media.xsl"/>

<xsl:template match="&db_chunks;">
  <xsl:param name="node" select="."/>
  <xsl:variable name="id">
    <xsl:for-each select="$node">
      <xsl:call-template name="db.chunk.chunk-id"/>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="href">
    <xsl:value-of select="concat($id, '.page')"/>
  </xsl:variable>
  <exsl:document href="{$href}">
    <page id="{$id}">
      <xsl:attribute name="type">
        <!-- FIXME: better chunk logic -->
        <xsl:choose>
          <xsl:when test="&db_chunks;">
            <xsl:text>guide</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>topic</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <info>
        <!-- FIXME: better chunk logic -->
        <xsl:if test="count($node/ancestor::*) > 0">
          <xsl:for-each select="$node/..">
            <link type="guide" group="{$id}">
              <xsl:attribute name="xref">
                <xsl:call-template name="db.chunk.chunk-id"/>
              </xsl:attribute>
            </link>
          </xsl:for-each>
        </xsl:if>
        <xsl:apply-templates mode="db2mal.info.mode" select="&db_infos;/*"/>
      </info>
      <xsl:apply-templates mode="db2mal.block.mode"
                           select="*[not(self::&db_chunks; or self::&db_infos;)]"/>
      <links type="topic">
        <xsl:attribute name="groups">
          <xsl:for-each select="&db_chunks;">
            <xsl:call-template name="db.chunk.chunk-id"/>
            <xsl:text> </xsl:text>
          </xsl:for-each>
        </xsl:attribute>
      </links>
    </page>
  </exsl:document>
  <xsl:apply-templates select="&db_chunks;"/>
</xsl:template>

<xsl:template match="*">
  <xsl:message>
    <xsl:text>Unmatched element: </xsl:text>
    <xsl:value-of select="local-name(.)"/>
  </xsl:message>
</xsl:template>

<!--
CHUNKS
======
colophon
dedication
article
articleinfo
appendix
appendixinfo
book
bookinfo
chapter
chapterinfo
sect1
sect1info
sect2
sect2info
sect3
sect3info
sect4
sect4info
sect5
sect5info
section
sectioninfo
preface
prefaceinfo
part
partinfo
partintro
-->

<!--
INFO
====
corpauthor
corpcredit
corpname
abstract
annotation
author
authorinitials
cover
date
extendedlink
keyword
keywordset
legalnotice
revhistory
revdescription
revision
revnumber
revremark
-->

<!--
INDEX
=====
itermset
index
indexdiv
indexentry
indexinfo
indexterm
setindex
setindexinfo
primary
primaryie
secondary
secondaryie
tertiary
tertiaryie
see
seealso
seealsoie
seeie
-->

<!--
REFSECT
=======
refclass
refdescriptor
refentry
refentryinfo
refentrytitle
reference
referenceinfo
refmeta
refmiscinfo
refname
refnamediv
refpurpose
refsect1
refsect1info
refsect2
refsect2info
refsect3
refsect3info
refsection
refsectioninfo
refsynopsisdiv
refsynopsisdivinfo
manvolnum
citerefentry
-->

<!--
BIBLIO
======
bibliocoverage
biblioid
bibliomset
bibliorelation
biblioset
bibliosource
bibliodiv
biblioentry
bibliography
bibliographyinfo
bibliolist
bibliomisc
bibliomixed
-->

<!--
GLOSS
=====
glossary
glossaryinfo
glossdef
glossdiv
glossentry
glosslist
glosssee
glossseealso
glossterm
-->

<!--
SYNOP
=====
classsynopsis
classsynopsisinfo
cmdsynopsis
constructorsynopsis
destructorsynopsis
fieldsynopsis
funcsynopsis
funcsynopsisinfo
lhs
productionset
production
productionrecap
rhs
methodsynopsis
funcparams
funcprototype
funcdef
paramdef
varargs
arg
group
methodparam
void
-->

<!--
TABLE
=====
informaltable
table
tr
tbody
td
tfoot
colspec
spanspec
tgroup
th
thead
row
entry
entrytbl
col
colgroup
-->

<!--
MEDIA
=====
audiodata
audioobject
textobject
textdata
videodata
videoobject
inlinemediaobject
alt
-->

<!--
TOC
===
toc
tocback
tocchap
tocentry
tocfront
toclevel
tocpart
-->

<!--
ADDRESS
=======
address
city
country
fax
otheraddr
phone
pob
postcode
state
street
-->

<!--
MISC
====
ackno
anchor
answer
area
areaset
areaspec
attribution
authorblurb
blockinfo
blockquote
bridgehead
callout
calloutlist
caption
citation
citebiblioid
co
constraint
constraintdef
contrib
coref
epigraph
equation
example
firstname
footnote
footnoteref
formalpara
graphic
graphicco
highlights
honorific
imageobjectco
informalequation
informalexample
informalfigure
inlineequation
inlinegraphic
label
lineage
lineannotation
link
literallayout
lot
lotentry
mediaobjectco
member
modespec
msg
msgaud
msgentry
msgexplan
msginfo
msglevel
msgmain
msgorig
msgrel
msgset
msgsub
msgtext
nonterminal
objectinfo
olink
ooclass
ooexception
oointerface
optional
orderedlist
othername
parameter
personblurb
personname
programlistingco
pubsnumber
qandadiv
qandaentry
qandaset
question
quote
remark
sbr
screenco
screeninfo
seg
seglistitem
segmentedlist
segtitle
set
setinfo
simplelist
simplemsgentry
simplesect
subscript
subtitle
superscript
surname
synopfragment
synopfragmentref
synopsis
task
taskprerequisites
taskrelated
tasksummary
title
titleabbrev
xref
-->

</xsl:stylesheet>
