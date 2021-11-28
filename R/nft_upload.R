#' 上传文件至数据库
#'
#' @param conn 连接
#' @param FCompanyPrefix 公司前缀
#' @param FFileName 文件名
#' @param FTxtId 文件ID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' nft_fileUpload()
nft_fileUpload <- function(conn = tsda::conn_rds('nftns'),
                           FCompanyPrefix,
                           FFileName ,
                           FTxtId

                           ) {
  FUploadDate = as.character(Sys.time())
  data = data.frame(FCompanyPrefix,FFileName,FTxtId,FUploadDate,stringsAsFactors = F)
  tsda::db_writeTable(conn = conn,table_name = 't_file',r_object = data,append = TRUE)

}


#' 上传证书至数据库
#'
#' @param conn 连接
#' @param FCompanyPrefix 公司前缀
#' @param FFileName 文件名
#' @param FTxtId 文件ID
#'
#' @return 返回值
#' @export
#'
#' @examples
#' nft_CertUpload()
nft_CertUpload <- function(conn = tsda::conn_rds('nftns'),

                           FFileName ,
                           FTxtId,
                           FFileHash,

                           blockid,
                           FCertUrl

) {


  FUploadDate = as.character(Sys.time())
  data = data.frame( FFileName ,
                     FTxtId,
                     FFileHash,

                     blockid,
                     FCertUrl,FUploadDate,stringsAsFactors = F)
  print(data)
  tsda::db_writeTable(conn = conn,table_name = 't_cert',r_object = data,append = TRUE)

}


#' 查询证书列表
#'
#' @param conn 查询
#'
#' @return 返回值
#' @export
#'
#' @examples
#' nft_queryList()
nft_queryList <- function(conn = tsda::conn_rds('nftns')) {

  sql = paste0("select
FFileName  as 文件名,
FFileTime as 存证时间,
FFileHash as 存证哈希,
FTxtId  as   存证保全ID,
blockid as 区块ID,
FCertUrl as 证书链接
from  vw_certInfo")
  res = tsda::sql_select(conn,sql)

}

