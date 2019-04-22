<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
  <body>
  <h2>My Academic Calendar</h2>  
   <xsl:for-each select="catalog/semester">
   <xsl:value-of select="@name"/>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th style="text-align:left">Catalog Number</th>
        <th style="text-align:left">Title</th>
        <th style="text-align:left">Prerequisite</th>
      </tr>
      <xsl:for-each select="class">
      <tr>
        <td><xsl:value-of select="number"/></td> 
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="prereq"/></td>
      </tr>
      </xsl:for-each>
  </table>
 </xsl:for-each>
  </body>
  </html>
   
</xsl:template>
</xsl:stylesheet>
