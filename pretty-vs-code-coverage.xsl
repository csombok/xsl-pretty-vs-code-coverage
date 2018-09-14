<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/CoverageDSPriv">
        <html>
            <head>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

                <style>
                    table .table-header {
                        padding-left: 10px;
                    }
                    .table-value {
                        text-align: right;
                        vertical-align: text-top;
                        padding-top: 5px;
                    }
                    .card-header {
                        padding: 2px!important;
                    }
                </style>
            </head>
            <body>
                <h2>Code Coverage Result</h2>
                <table>
                    <tr>
                        <th class="table-header">Module</th>
                        <th class="table-header">Covered %</th>
                        <th class="table-header">Covered Lines</th>
                        <th class="table-header">Not Covered Lines</th>
                    </tr>
                    <xsl:apply-templates select="Module"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Module">
        <tr>
            <td>
                <div id="accordion_{ModuleName}">
                    <div class="card">
                        <div class="card-header" id="heading_{ModuleName}">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapse_{ModuleName}" aria-expanded="false" aria-controls="collapse_{ModuleName}">
                                    <xsl:value-of select="ModuleName"/>
                                </button>
                            </h5>
                        </div>

                        <div id="collapse_{ModuleName}" class="collapse" aria-labelledby="heading_{ModuleName}" data-parent="#accordion_{ModuleName}">
                            <div class="card-body">
                                <table>
                                    <tr>
                                        <th class="table-header">NameSpace</th>
                                        <th class="table-header">Covered %</th>
                                        <th class="table-header">Covered Lines</th>
                                        <th class="table-header">Not Covered Lines</th>
                                    </tr>
                                    <xsl:apply-templates select="NamespaceTable"/>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td class="table-value">
                <xsl:value-of select="round(LinesCovered div (LinesNotCovered + LinesCovered) * 100)" />
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesCovered"/>
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesNotCovered"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="NamespaceTable">
        <tr>
            <td>
                <div id="accordion_{NamespaceName}">
                    <div class="card">
                        <div class="card-header" id="heading_{NamespaceName}">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapse_{NamespaceName}" aria-expanded="false" aria-controls="collapse_{NamespaceName}">
                                    <xsl:value-of select="NamespaceName"/>
                                </button>
                            </h5>
                        </div>

                        <div id="collapse_{NamespaceName}" class="collapse" aria-labelledby="heading_{NamespaceName}" data-parent="#accordion_{NamespaceName}">
                            <div class="card-body">
                                <table>
                                    <tr>
                                        <th class="table-header">Class</th>
                                        <th class="table-header">Covered %</th>
                                        <th class="table-header">Covered Lines</th>
                                        <th class="table-header">Not Covered Lines</th>
                                    </tr>
                                    <xsl:apply-templates select="Class"/>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td class="table-value">
                <xsl:value-of select="round(LinesCovered div (LinesNotCovered + LinesCovered) * 100)" />
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesCovered"/>
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesNotCovered"/>
            </td>

        </tr>
    </xsl:template>

    <xsl:template match="Class">
        <tr>
            <td>
                <div id="accordion_{ClassName}">
                    <div class="card">
                        <div class="card-header" id="heading_{ClassName}">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapse_{ClassName}" aria-expanded="false" aria-controls="collapse_{ClassName}">
                                    <xsl:value-of select="ClassName"/>
                                </button>
                            </h5>
                        </div>

                        <div id="collapse_{ClassName}" class="collapse" aria-labelledby="heading_{ClassName}" data-parent="#accordion_{ClassName}">
                            <div class="card-body">
                                <table>
                                    <tr>
                                        <th class="table-header">Method</th>
                                        <th class="table-header">Covered %</th>
                                        <th class="table-header">Covered Lines</th>
                                        <th class="table-header">Not Covered Lines</th>
                                    </tr>
                                    <xsl:apply-templates select="Method"/>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <td class="table-value">
                <xsl:value-of select="round(LinesCovered div (LinesNotCovered + LinesCovered) * 100)" />
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesCovered"/>
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesNotCovered"/>
            </td>

        </tr>
    </xsl:template>

    <xsl:template match="Method">
        <tr>
            <td>
                <xsl:value-of select="MethodName"/>
            </td>
            <td class="table-value">
                <xsl:value-of select="round(LinesCovered div (LinesNotCovered + LinesCovered) * 100)" />
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesCovered"/>
            </td>
            <td class="table-value">
                <xsl:value-of select="LinesNotCovered"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>