
fetch('http://localhost:8081/api/user').then(res => res.json()).then(user => {
    const parent = document.querySelector('.user-info')
    head = `<thead>
                <tr class="">
                  <td class="avatar">Ảnh đại diện</td>
                  <td class="name"> Họ tên người dùng</td>
                  <td class="email">Địa chỉ email</td>
                  <td class="login">Phương thức</td>
                  <td class="order">Số đơn hàng</td>
                  <td class="action"> Hành động </td>
                </tr>
            </thead>
            <tbody>`
    body = head
    for (var i = 0; i < user.length; i++) {
        body += `<tr class=''>
                    <td class='avatar'>
                      <img src="/userImage?id=` + user[i].id + `" alt="" class='' />
                    </td>
                    <td class='name'>
                      <span class=''>` + user[i].name + `</span>
                    </td>
                    <td class='email'>
                      <p class="">` + user[i].email +`</p>
                    </td>
                    <td class='login'>`
        if(user[i].provider === 'gmail')
            body += `<i style="color: var(--text-primary);" class="fab fa-google"></i>`
        else
            body += `<i style="color: #2563EB;" class="fas fa-envelope"></i>`
        body += `</td>
                <td class='order'>
                  <p class=''>` + user[i].orderList.length +`</p>
                </td>
                <td class='action'>
                  <button class=''>
                    <i class="fas fa-lock"></i>
                    </button>
                    <button class=''>
                      <i class="fas fa-gift"></i>
                    </button>
                </td>
            </tr>`
    }   
    body += '</tbody>'
    parent.innerHTML = body

              
    
});


