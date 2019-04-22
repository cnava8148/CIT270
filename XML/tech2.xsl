<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <body>
     <h2>5-Day Weather Forecast for GPS Location
     (<xsl:value-of select="data/location/point/@latitude"/> , 
      <xsl:value-of select="data/location/point/@longitude"/>)
     </h2>
    <table border="3">
      <tr bgcolor="#9acd32">
          <td>Temperature</td>
        <xsl:for-each select="data/time-layout[layout-key='k-p24h-n5-1']">
          <xsl:for-each select="start-valid-time">
        <th><xsl:value-of select="@period-name"/></th>
           </xsl:for-each>
         </xsl:for-each>
      </tr>
      <tr>
        <td>Daily Maximum Temperature </td>
        <xsl:for-each select="data/parameters/temperature">
          <xsl:if test='@type="maximum"'>
           <xsl:for-each select="value">
           <td align="center"><xsl:value-of select="."/></td>
         </xsl:for-each>
         </xsl:if>
        </xsl:for-each>
       </tr>
      <tr>
        <td>Daily Minimum Temperature </td>
       <xsl:for-each select="data/parameters/temperature">
      <xsl:if test='@type="minimum"'>
       <xsl:for-each select="value">       <td align="center"><xsl:value-of select="."/></td>
        </xsl:for-each>
         </xsl:if>
         </xsl:for-each>
       </tr>
       </table>
      <br></br>
  <br></br>
    <br></br>
 <table border="3">
      <tr bgcolor="#9acd32">
        <td>Conditions</td>
        <xsl:for-each select="data/time-layout[layout-key='k-p12h-n10-3']"><xsl:for-each select="start-valid-time">
       <th><xsl:value-of select="@period-name"/></th>
       </xsl:for-each>
    </xsl:for-each>
      </tr>
      <tr>
       <td>12 Hourly<br></br>Probability<br></br>of <br></br>Precipitation</td>
     <xsl:for-each select="data/parameters/probability-of-precipitation/value">
    <td align="center"><xsl:value-of select="."/></td>
     </xsl:for-each>
    </tr>
      <tr>
       <td>Weather<br></br>Type,<br></br>Coverage,<br></br>and Intensity</td>
     <xsl:for-each select="data/parameters/weather/weather-conditions">
      <td align="center"><xsl:value-of select="@weather-summary"/></td>
     </xsl:for-each>
      </tr>
      <tr>
        <td><xsl:value-of select="data/parameters/conditions-icon/name"/></td>
      <xsl:for-each select="data/parameters/conditions-icon/icon-link">
        <td align="center"><img><xsl:attribute name="src"><xsl:value-of select="."/></xsl:attribute></img></td>
        </xsl:for-each>
      </tr>
    </table>
   </body>
</html>
</xsl:template>
</xsl:stylesheet>
    
