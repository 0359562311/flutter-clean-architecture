String mapErrorCode(String errorCode){
  switch(errorCode){
    case "UNAUTHORIZED_USERNAME_NOT_FOUND":
      return "Không tìm thấy username";
    case "UNAUTHORIZED_WRONG_PASSWORD":
      return "Sai mật khẩu";
    default:
      return "Đã có lỗi xảy ra";
  }
}