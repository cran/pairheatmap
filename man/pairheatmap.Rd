\name{pairheatmap}
\alias{pairheatmap}
\title{Heatmap Comparison}
\description{
The main function for comparing heatmaps
}
\usage{
pairheatmap (data1, data2,
          scale="none", dendrogram="both",
          matDist=0.5, matrixBorderCol = "grey",
          colorStyle="s1",
          rowGroup=rowGroup,
          orderRowGroup=NULL,
          rowGroupColor=FALSE,
          rowGroupColor.choice,
          groupBorder="line",
          groupBorder.selectList=list(),
          groupBorder.lwd=3,
          groupBorder.col="green",
          rowNameColor="blue",
          colNameColor="blue",
          rowNameFontSize=7,
          colNameFontSize=7,
          rowNameGroupColor=NULL,
          clusterMethod="complete", clusterMembers=NULL,
          clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=FALSE,
          legend.pos="middle", legend.percent=0.5, legend.fontsize=7
          )
}
\arguments{
	\item{data1}{numeric matrix 1. It is considered as the standard matrix. }
	\item{data2}{numeric matrix 2. Its row order is same as that in data1. Its column order is either same as that in data1 or use separate cluster method.}
	\item{scale}{character. It takes four values: "row", "col", "rowsep", "none"(default value). It indicates whether or not the data matrix is scaled in row/column direction. When "rowsep" is selected, the two data matrices are scaled separately in row direction.}
  \item{dendrogram}{character. It takes three values: "row", "col", "both"(default value). It indicates whether or not to draw the row/col/both dendrogram.}
  \item{matDist}{the separate distance between two data matrices. Default value is 0.5. If its value is 1, the distance between two matrices is exactly one data column.}
	\item{matrixBorderCol}{the color of the matrix border. Default value is "grey".}
	\item{colorStyle}{the color style for the matrix cell. It takes four values: "s1"(default value), "s2", "s3", "s4". s1 ranges from blue to red; s2 ranges from green to red; s3 uses a default color style from R package, pheatmap; s4 ranges from white to black.}
	\item{rowGroup}{Row group variable.}
	\item{orderRowGroup}{variable. The default value is "NULL". It is the row levels that should be ordered.}
	\item{rowGroupColor}{logical value. It takes two values: "TRUE", "FALSE". It indicates whether or not to draw the row group bar. }
	\item{rowGroupColor.choice}{character. It works when rowGroupColor is set as TRUE. The character length must match the unique groups in the rowGroup. If it is not specified, the colorStyle is used as default value. }
	\item{groupBorder}{character. It takes two values: "line"(default value), "rect". It controls the shape of the group border.}
	\item{groupBorder.selectList}{a list. It controls which group to be selected, which
    includes four components, "xgroup.start", "xgroup.end", "ygroup.start" and "ygroup.end".
    The selected groups will utilize the same graphical parameters as groupBorder.}
	\item{groupBorder.lwd}{numeric. Default value is 3. It controls the line width of the groupBorder.}
	\item{groupBorder.col}{character. Default value is "green". It controls the line color of the groupBorder.}
	\item{rowNameColor}{character string. Default value is "blue". It controls the label color of the row name.}
	\item{colNameColor}{character string. Default value is "blue". It controls the label color of the column name.}
	\item{rowNameFontSize}{numeric scalar. Default value is 7. It controls the font size of the row name.}
	\item{colNameFontSize}{numeric scalar. Default value is 7. It controls the font size of the column name. }
	\item{rowNameGroupColor}{character variable. The character length must match the
      unique groups in the rowGroup. It controls the color of different groups of row names. }
	\item{clusterMethod}{character. It takes the follow values: "ward", "single", "complete"(default value),
        "average", "mcquitty", "median" or "centroid".}
	\item{clusterMembers}{NULL or a vector. See function: "hclust" of the package "stats" for details.}
	\item{clusterRow}{logical. It takes two values: "TRUE"(default value), "FALSE". It indicates whether or not
      to cluster rows.}
	\item{clusterCol}{logical. It takes two values: "TRUE"(default value), "FALSE". It indicates whether or not
      to cluster columns.}
	\item{clusterColTogether}{logical. It takes two values: "TRUE", "FALSE"(default value). It indicates whether
    or not the columns of data matrix 2 follows the same clustering order of that in data matrix 1.
    If the column number of data matrix 2 is different from that of data matrix 1, only the columns
    matching those of data matrix 1 are reordered. }
 	\item{legend.pos}{character. It takes three values: "top", "middle"(default value), "bottom".
      It controls the position of the legend.}
	\item{legend.percent}{numeric. It takes value from 0 to 1. Default value is 0.5. If its value is 1,
      the height of the legend will be equal to the height of the heatmap.}
	\item{legend.fontsize}{numeric. Default value is 7. It controls the font size of the legend labels. }
}
\details{
This function compares two heatmaps and discovers links and patterns within and across groups. In the context of biology, group can be defined based on gene ontology or selected gene lists.

}
\value{
Invisibly return the row and column index for two matrices.
}
\author{Xiaoyong Sun}
\examples{
## simple demo
chvalue <- pairheatmap(mtcars, mtcars)
chvalue
pairheatmap(mtcars, mtcars, scale="row")
pairheatmap(mtcars, mtcars[,1:5], scale="row")
pairheatmap(mtcars, mtcars[,1:5], scale="rowsep")
pairheatmap(mtcars, mtcars[,1:5], scale="col")
## row group bar
pairheatmap(mtcars, mtcars,
rowGroup=mtcars$gear,
rowNameFontSize=6,
colNameFontSize=6,
rowNameGroupColor=rev(c("blue",  "green", "orange")),
rowNameColor="blue",
)
## group options
pairheatmap(mtcars, mtcars,
rowGroup=mtcars$gear,
orderRowGroup=c(5, 4,3)
)
## legend
pairheatmap(mtcars, mtcars,
legend.pos="middle", legend.percent=0.6, legend.fontsize=7)
## cluster analysis
pairheatmap(mtcars, mtcars, clusterMethod="ward", clusterRow=FALSE)
pairheatmap(mtcars,  cbind(mtcars, mtcars), clusterColTogether=TRUE)
## selected groups
pairheatmap(mtcars,  cbind(mtcars, mtcars),
groupBorder.selectList=
      list(xgroup.start=c(2,7), xgroup.end=c(4,9),
           ygroup.start=c(3,30), ygroup.end=c(10,32)
           ))
## more demo
pairheatmap(mtcars, mtcars,  legend.percent=1, legend.pos="middle",
         groupBorder.selectList=list(xgroup.start=c(2,7), xgroup.end=c(4,9), ygroup.start=c(3,30),
         ygroup.end=c(10,32)))
pairheatmap(mtcars, mtcars, scale="row", colorStyle="s3",
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11),
         ygroup.start=c(11), ygroup.end=c(15)),
         legend.pos="top")
pairheatmap(mtcars, mtcars,
         colorStyle="s4", rowGroup=mtcars$gear,
         rowGroupColor=TRUE,
         rowGroupColor.choice = rev(c("blue", "orange", "green")),
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25)),
         legend.pos="top", legend.percent=0.6, legend.fontsize=5, orderRowGroup=c(5, 4,3),
         clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=TRUE
         )
mtcars2 <- mtcars[, rev(1:ncol(mtcars))]
pairheatmap(mtcars, mtcars2,
         colorStyle="s1", rowGroup=mtcars$gear,
         rowGroupColor=TRUE,
         rowGroupColor.choice = rev(c("blue", "orange", "green")),
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25)),
         legend.pos="top", legend.percent=0.6, legend.fontsize=5, orderRowGroup=c(5, 4,3),
         clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=FALSE
         )
pairheatmap(mtcars, mtcars,
         dendrogram="row", colorStyle="s1", rowGroup=mtcars$am,
         rowGroupColor=TRUE,
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25)),
         legend.pos="top", legend.percent=0.6, legend.fontsize=5,
         orderRowGroup=c(0,1),
         clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=FALSE
         )
}
\keyword{ methods}

