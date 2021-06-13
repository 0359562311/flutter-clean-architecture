String mapErrorCode(String errorCode){
  switch(errorCode){
    case "UNAUTHORIZED_USERNAME_NOT_FOUND":
      return "Không tìm thấy username";
    case "UNAUTHORIZED_WRONG_PASSWORD":
      return "Sai mật khẩu";
    case "BAD_REQUEST_EMPTY_CLIENT_DEVICE_ID":
      return "Không có thông tin client device id khi đăng nhập";
    case "BAD_REQUEST_DEVICE_IDENDIFIED":
      return "Người dùng đã được xác nhận thiết bị";
    case "BAD_REQUEST_CLIENT_DEVICE_ID_EXIST":
      return "Thiết bị đã được đăng ký cho một người dùng khác";
    case "BAD_REQUEST_WRONG_PASSWORD":
      return "Mật khẩu không chính xác";
    default:
      return "Đã có lỗi xảy ra";
  }
}