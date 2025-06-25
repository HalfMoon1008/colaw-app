// server.js
const express = require('express');
const cors = require('cors');
const base64 = require('base-64');

const app = express();
app.use(cors());
app.use(express.json());

// ✅ 가상의 사용자 DB
const users = [
  { id: 'testuser', password: '1234', is_paid_user: true },
  { id: 'freeuser', password: 'abcd', is_paid_user: false },
];

app.post('/api/login', (req, res) => {
  const encodedId = req.body.id;
  const encodedPwd = req.body.pwd;

  console.log('[📥 요청 수신됨]');
  console.log('Base64 ID:', encodedId);
  console.log('Base64 PW:', encodedPwd);

  const id = base64.decode(encodedId);
  const pwd = base64.decode(encodedPwd);

  console.log('디코딩 결과 → ID:', id, 'PW:', pwd);

  const user = users.find(u => u.id === id && u.password === pwd);

  if (!user) {
    console.log('[❌ 사용자 없음]');
    return res.status(401).json({ result: 'FAIL', message: '사용자 없음' });
  }

  if (!user.is_paid_user) {
    console.log('[❌ 결제 필요]');
    return res.status(403).json({ result: 'FAIL', message: '결제 필요' });
  }

  console.log('[✅ 로그인 성공]');
  return res.status(200).json({
    result: 'SUCCESS',
    redirectUrl: 'https://www.colaw.co.kr/mobileManage/mobileMainView',
  });
});


// 응답에 따라 
// 1. redirectUrl 기반
// {
//   "resultMsg": "SUCCESS",
//   "redirectUrl": "https://www.colaw.co.kr/mobileManage/mobileMainView"
// }

// if (data['resultMsg'] == 'SUCCESS') {
//   return data['redirectUrl'];
// }


// 2. 서버가 redirectUrl을 안주는 경우 => Flutter가 직접 URL로 이동
// 로그인 성공 조건을 판단 (예: resultMsg == 'SUCCESS')
// 이후 'return https://www.colaw.co.kr/mobileManage/mobileMainView';'


// 서버 실행
const PORT = 4000;
app.listen(PORT, () => console.log(`✔ 가상 로그인 서버 실행 중 → http://localhost:${PORT}`));
