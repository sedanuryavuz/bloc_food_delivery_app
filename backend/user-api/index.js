require('dotenv').config(); 

const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt'); 
const User = require('./models/User'); 

const app = express();
const port = 3000;

app.use(bodyParser.json());

// MongoDB bağlantısı
mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log('MongoDB bağlantısı başarılı'))
    .catch((err) => console.error('MongoDB bağlantı hatası:', err));

// Kullanıcı kaydı
app.post('/api/register', async (req, res) => {
    const { username, email, password } = req.body;

    if (!username || !email || !password) {
        return res.status(400).json({ message: 'Tüm alanlar zorunludur.' });
    }

    try {
        const existingUser = await User.findOne({ email });

        if (existingUser) {
            return res.status(409).json({ message: 'Bu e-posta zaten kayıtlı.' }); 
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const newUser = new User({
            username,
            email,
            password: hashedPassword
        });

        await newUser.save();

        return res.status(201).json({
            message: 'Kullanıcı başarıyla kaydedildi.',
            user: {
                username: newUser.username,
                email: newUser.email
            }
        });

    } catch (err) {
        console.error(err);
        return res.status(500).json({ message: 'Kayıt sırasında sunucu hatası oluştu.' });
    }
});


app.get('/api/users', async (req, res) => {
    try {
        const allUsers = await User.find({}, { password: 0 }); 
        res.json(allUsers);
    } catch (err) {
        res.status(500).json({ message: 'Kullanıcıları çekerken hata oluştu.' });
    }
});

app.listen(port, () => {
    console.log(`API ${port} portunda çalışıyor...`);
});
