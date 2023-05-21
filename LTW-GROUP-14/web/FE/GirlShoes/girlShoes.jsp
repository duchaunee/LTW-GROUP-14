<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Girl Shoes</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
  <link rel="stylesheet" href="../CSS/reset.css" type="text/css">
  <link rel="stylesheet" href="../CSS/lineClamp.css" type="text/css">
  <link rel="stylesheet" href="girlShoes.css" type="text/css">
  <link rel="stylesheet" href="../Header/header.css" type="text/css">
  <link rel="stylesheet" href="../Footer/footer.css" type="text/css" >
</head>

<body>
  <div class="header"></div>
  <div class='girlShoes'>
    <div class="girlShoes__header">
      <div class="girlShoes__header--left">
        <a href='#' class=''>
          Trang chủ
        </a>
        <div class="">/</div>
        <span class=''>Giày nữ</span>
      </div>
      <div class="girlShoes__header--right">
        <p class=''>
          <span class=''>Số lượng</span>: 12 sản phẩm
        </p>
        <select class='' name="sort-by" id="">
          <option key='0' value="default">Sắp xếp theo</option>
          <option key='1' value="latest">Mới nhất</option>
          <option key='2' value="oldest">Cũ nhất</option>
          <option key='3' value="lowest-price">Giá tăng dần</option>
          <option key='4' value="highest-price">Giá giảm dần</option>
          <option key='5' value="a-z">A - Z</option>
          <option key='6' value="z-a">Z - A</option>
        </select>

        <select class='' name="sort-by" id="">
          <option key='0' value="default">Lọc sản phẩm theo</option>
          <option key='1' value="all">Tất cả</option>
          <option key='2' value="classic">Classic</option>
          <option key='3' value="sunbaked">Sunbaked</option>
          <option key='4' value="chuck-07s">Chuck 07S</option>
          <option key='5' value="one-star">One Star</option>
          <option key='6' value="psy-kicks">PSY Kicks</option>
        </select>
      </div>
    </div>

    <!-- {/* bot */} -->
    <div class="girlShoes__bot">
      <div class='girlShoes__bot--main'>
        <!-- {/* left */} -->
        <div class='girlShoes__bot--left'>
          <div class="w-full">
            <aside class="girlShoes__bot--filter">
              <p class=''>Khoảng giá</p>
              <div class=''>
                <div class="girlShoes__bot-range">
                  <label for='min' class=''>
                    Từ
                  </label>
                  <input required class="" autoComplete="off" placeholder='VNĐ'
                    maxLength={maxLength} id="min" />
                </div>
                <div class="girlShoes__bot--line"></div>
                <div class="girlShoes__bot-range">
                  <label for='max' class=''>
                    Đến
                  </label>
                  <input required class="" autoComplete="off" placeholder='VNĐ'
                    maxLength={maxLength} id="max" />
                </div>
              </div>
              <span class="">
                <button class="">
                  Lọc
                </button>
                <div class=''>
                  Giá
                  <p class=''>500.000 ₫</p>
                  <p class=''>-</p>
                  <p class=''>3.000.000 ₫</p>
                </div>
              </span>
            </aside>
            <!--  -->
            <div class="girlShoes__bot---newest">
              <p class=''>Sản
                phẩm</p>
              <ul class="girlShoes__bot---newestList">
                <li class='girlShoes__bot---newestItem'>
                  <img class='' src='https://source.unsplash.com/random' alt="" />
                  <div class="">
                    <a class='line-clamp-1'>One Star Love the Progress</a>
                    <span class=''>
                      1.850.000₫
                      <p class=''>₫</p>
                    </span>
                  </div>
                </li>
                <li class='girlShoes__bot---newestItem'>
                  <img class='' src='https://source.unsplash.com/random' alt="" />
                  <div class="">
                    <a class='line-clamp-1'>One Star Love the Progress</a>
                    <span class=''>
                      1.850.000₫
                      <p class=''>₫</p>
                    </span>
                  </div>
                </li>
                <li class='girlShoes__bot---newestItem'>
                  <img class='' src='https://source.unsplash.com/random' alt="" />
                  <div class="">
                    <a class='line-clamp-1'>One Star Love the Progress</a>
                    <span class=''>
                      1.850.000₫
                      <p class=''>₫</p>
                    </span>
                  </div>
                </li>
                <li class='girlShoes__bot---newestItem'>
                  <img class='' src='https://source.unsplash.com/random' alt="" />
                  <div class="">
                    <a class='line-clamp-1'>One Star Love the Progress</a>
                    <span class=''>
                      1.850.000₫
                      <p class=''>₫</p>
                    </span>
                  </div>
                </li>
                <li class='girlShoes__bot---newestItem'>
                  <img class='' src='https://source.unsplash.com/random' alt="" />
                  <div class="">
                    <a class='line-clamp-1'>One Star Love the Progress</a>
                    <span class=''>
                      1.850.000₫
                      <p class=''>₫</p>
                    </span>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <div class="girlShoes__bot--right">
          <div class='girlShoes__bot--productWrapper'>
            <!-- <div class="girlShoes__bot--productList">
              <div class=''>
                <div class='girlShoes__bot--productItem'>
                  <div class='girlShoes__bot--productItem img'>
                    <a class=''>
                      <img draggable="false" class='' src='https://source.unsplash.com/random'
                        alt="" />
                    </a>
                  </div>
                  <div class="girlShoes__bot--productItem content">
                    <div class="girlShoes__bot--productItem name">
                      <a>One Star Sunbaked</a>
                    </div>
                    <div class="girlShoes__bot--productItem price">
                      1.600.000
                      <p class=''>₫</p>
                    </div>
                    <div class='girlShoes__bot--productItem btn'>
                      <div class="mt-[10px]">
                        <button class=''>
                          <span>
                            Thêm vào giỏ
                          </span>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div> -->
          </div>
          <!-- pagination -->
          <ol class="girlShoes__pagination">
            <li class="girlShoes__pagination--left">
              <button>
                <i class="fas fa-long-arrow-alt-left"></i>
                <span class="text-[16px]">Prev Page</span>
              </button>
            </li>
            <div class="girlShoes__pagination-center">
              <!-- <button class=''>1</button> -->
              <!-- <li class=''>
                <i class="fas fa-ban"></i>
              </li> -->
            </div>
            <li class="girlShoes__pagination--right">
              <button>
                <span class="text-[16px]">Next Page</span>
                <i class="fas fa-long-arrow-alt-right"></i>
                <FontAwesomeIcon class='text-[18px] text-bgPrimary' icon={faLongArrowAltRight} />
              </button>
            </li>
          </ol>
        </div>
      </div>
    </div>
  </div>
  <div class="footer"></div>
  <script defer src="./girlShoes.js"></script>
  <script defer src="../Header/header.js"></script>
  <script defer src="../Footer/footer.js"></script>
</body>

</html>

