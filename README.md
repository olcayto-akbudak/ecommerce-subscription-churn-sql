# E-Ticaret Abonelik Churn Analizi (SQL Only)

## 📌 Proje Amacı
Bu proje, abonelik tabanlı bir e-ticaret platformunda müşteri kaybını (customer churn) analiz etmek amacıyla geliştirilmiştir.  
Tüm analizler herhangi bir BI aracı kullanılmadan, **yalnızca SQL ve VIEW yapıları** kullanılarak gerçekleştirilmiştir.

Projenin temel hedefleri:
- Churn eden müşterileri tespit etmek
- Churn oranlarını zaman ve segment bazında analiz etmek
- Gelir (MRR) kaybını ölçmek
- Cohort tabanlı müşteri sadakatini incelemek

---

## 🧠 İş Problemi (Business Problem)
Abonelik tabanlı e-ticaret platformlarında müşteri kazanımı kadar **müşteriyi elde tutma (retention)** da kritik öneme sahiptir.  
Bu projede aşağıdaki sorulara cevap aranmıştır:

- Hangi aylarda churn oranı artıyor?
- Hangi abonelik planlarında churn daha yüksek?
- Churn gelir kaybını nasıl etkiliyor?
- Hangi dönemlerde kazanılan müşteriler daha sadık?

---

## 🗂️ Proje Veri Modeli (Şema)

Proje, abonelik tabanlı bir e-ticaret sistemini temsil eden aşağıdaki tablolar üzerinden modellenmiştir:

### customers
Müşteri temel bilgilerini içerir.
- customer_id
- signup_date
- country
- gender
- acquisition_channel

### subscriptions
Müşterilerin abonelik ve plan bilgilerini içerir.
- subscription_id
- customer_id
- plan_type (Basic / Premium / Pro)
- start_date
- end_date
- status (active / cancelled)

### payments
Aboneliklere ait ödeme ve gelir bilgilerini içerir.
- payment_id
- subscription_id
- payment_date
- amount
- payment_status (success / failed)

### orders
Müşterilerin abonelik dışı siparişlerini temsil eden destekleyici tablodur.
- order_id
- customer_id
- order_date
- order_amount

Tablolar arasındaki ilişkiler, müşteri → abonelik → ödeme akışını takip edecek şekilde tasarlanmıştır.

---

## 📉 Churn Tanımı
Bir müşteri aşağıdaki durumlardan biri gerçekleştiğinde **churn** olarak kabul edilir:

- Abonelik durumu `cancelled` ise  
- Son **30 gün** içerisinde **başarılı bir ödeme** gerçekleştirmemişse  

Bu tanım, churn hesaplamasının tüm projede **tek bir master VIEW** üzerinden merkezi olarak yönetilmesini sağlar.

---

## 📊 Yapılan Analizler

### 1️⃣ Aylık Churn Metrikleri
- Aylık aktif müşteri sayısı
- Aylık churn eden müşteri sayısı
- Aylık churn oranı (%)

### 2️⃣ Plan Bazlı Churn Analizi
- Abonelik planlarına göre churn oranları
- Segment bazlı müşteri kaybı analizi

### 3️⃣ Gelir (MRR) Churn Analizi
- Aylık toplam gelir (MRR)
- Churn eden müşterilerden kaynaklanan gelir kaybı

### 4️⃣ Cohort Retention Analizi
- Cohort’lar, müşterilerin **ilk başarılı ödeme yaptıkları aya** göre tanımlanmıştır
- Ay bazında müşteri elde tutma (retention) oranları hesaplanmıştır
- Bu analiz ile müşteri sadakati zaman içerisinde izlenmiştir

---

## 🧮 Kullanılan SQL Teknikleri
- VIEW tabanlı dashboard mimarisi
- Common Table Expressions (CTE)
- Tarih ve zaman fonksiyonları
- Segment bazlı analiz
- Cohort & retention hesaplamaları
- Merkezi churn logic tasarımı

---

## 📈 Çıktılar ve Kullanım
Oluşturulan VIEW’ler:
- Doğrudan SQL dashboard olarak kullanılabilir
- BI araçlarına (Power BI, Tableau vb.) veri kaynağı olarak bağlanabilir
- Yönetim raporları ve karar destek sistemlerinde kullanılabilir

Proje, gerçek hayattaki abonelik tabanlı e-ticaret sistemleri göz önünde bulundurularak tasarlanmıştır.

---

## 🚀 Sonuç
Bu çalışma ile:
- Müşteri kaybı ve gelir kaybı net bir şekilde analiz edilmiştir
- Churn ve retention metrikleri SQL ile sürdürülebilir hale getirilmiştir
- BI aracı kullanılmadan güçlü bir analiz altyapısı oluşturulmuştur
