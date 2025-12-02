<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Catálogo de Películas</title>
                <style>
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid black; padding: 8px; text-align: center; }
                    th { background-color: #f2f2f2; }
                    img { max-width: 100px; }
                </style>
            </head>
            <body>
                <h2>Catálogo de Películas</h2>
                <table>
                    <tr>
                        <th>Título</th>
                        <th>Género</th>
                        <th>Director</th>
                        <th>Duración (min)</th>
                        <th>Valoración</th>
                        <th>Más de 2 horas</th>
                        <th>Imagen</th>
                    </tr>
                    <xsl:for-each select="peliculas/pelicula">
                        <tr>
                            <td><xsl:value-of select="@titulo"/></td>
                            <td><xsl:value-of select="genero"/></td>
                            <td><xsl:value-of select="director"/></td>
                            <td><xsl:value-of select="duracion"/></td>
                            <td><xsl:value-of select="valoracion"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="number(duracion) &gt; 120">Sí</xsl:when>
                                    <xsl:otherwise>No</xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="imagen"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="@titulo"/>
                                </xsl:attribute>
                            </img></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
