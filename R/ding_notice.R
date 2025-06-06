#' Send notification to DingTalk Robot
#'
#' @param access_token The access token of the DingTalk robot webhook.
#' @param content The text message to send.
#' @return A character string response from the API.
#' @export
#' @examples
#' ding_notice("your_token_here", "Job finished!")
ding_notice <- function(access_token, content = "finish") {
  url <- paste0(
    "https://oapi.dingtalk.com/robot/send?access_token=", access_token
  )

  body <- list(
    msgtype = "text",
    text = list(content = content)
  )

  res <- httr::POST(
    url,
    body = body,
    encode = "json",
    httr::add_headers(`Content-Type` = "application/json")
  )

  httr::content(res, "text", encoding = "UTF-8")
}
