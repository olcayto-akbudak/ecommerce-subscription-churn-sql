# E-Ticaret Abonelik Churn Analiz Raporu

## 1. Yönetici Özeti (Executive Summary)

Bu rapor, abonelik tabanlı bir e-ticaret platformunda müşteri kaybını (churn) anlamak, churn oranlarını ölçmek ve gelir üzerindeki etkisini analiz etmek amacıyla hazırlanmıştır.

Analizler sonucunda:
- Churn oranlarının özellikle müşterinin ilk abonelik aylarını takip eden dönemde yükseldiği
- Düşük fiyatlı abonelik planlarında müşteri kaybının daha yüksek olduğu
- Churn eden müşterilerin toplam gelir (MRR) üzerinde anlamlı bir kayba yol açtığı
- Bazı müşteri cohort’larının diğerlerine kıyasla daha yüksek sadakat gösterdiği

tespit edilmiştir.

Bu bulgular, müşteri elde tutma (retention) stratejilerinin özellikle erken dönem müşteri deneyimine odaklanması gerektiğini göstermektedir.

---

## 2. Veri Kaynakları ve Metodoloji

### 2.1 Kullanılan Veri Setleri
Analizler aşağıdaki temel tablolar üzerinden gerçekleştirilmiştir:
- `customers`: Müşteri demografik ve kayıt bilgileri
- `subscriptions`: Abonelik planları ve durumları
- `payments`: Ödeme ve gelir bilgileri
- `orders`: Abonelik dışı sipariş verileri

### 2.2 Churn Tanımı
Bir müşteri aşağıdaki koşullardan en az birini sağladığında **churn** olarak kabul edilmiştir:
- Abonelik durumunun `cancelled` olması
- Son 30 gün içerisinde başarılı bir ödeme kaydının bulunmaması

Bu tanım, tüm analizlerde ortak olarak kullanılan merkezi bir SQL VIEW üzerinden uygulanmıştır.

### 2.3 Analiz Yaklaşımı
- Tüm metrikler SQL VIEW’ler aracılığıyla hesaplanmıştır
- BI veya görselleştirme aracı kullanılmamıştır
- Aylık bazda zaman serisi analizi yapılmıştır
- Segment, plan ve cohort bazlı kırılımlar uygulanmıştır

---

## 3. Genel Churn Analizi

Aylık churn analizleri incelendiğinde:
- Churn oranlarının zaman içerisinde dalgalı bir seyir izlediği
- Belirli dönemlerde churn oranlarında belirgin artışlar olduğu
- Aktif müşteri sayısı arttıkça mutlak churn sayısının da yükseldiği

gözlemlenmiştir.

Bu durum, müşteri büyümesinin tek başına yeterli olmadığını, aynı zamanda müşteri elde tutma stratejilerinin de güçlendirilmesi gerektiğini göstermektedir.

---

## 4. Segment Bazlı Churn Analizi

### 4.1 Abonelik Planına Göre Churn
Abonelik planları bazında yapılan analizlerde:
- Basic plan kullanıcılarının churn oranının diğer planlara kıyasla daha yüksek olduğu
- Premium ve Pro plan müşterilerinin daha uzun süre platformda kaldığı

tespit edilmiştir.

Bu sonuç, fiyat hassasiyeti yüksek müşterilerin churn riskinin daha fazla olduğunu göstermektedir.

### 4.2 Müşteri Yaşam Döngüsüne Göre Churn
- Yeni müşterilerde churn oranı daha yüksektir
- Uzun süredir aktif olan müşterilerde churn riski belirgin şekilde düşmektedir

Bu bulgu, erken dönem müşteri deneyiminin kritik bir faktör olduğunu ortaya koymaktadır.

---

## 5. Gelir (MRR) Churn Analizi

Churn yalnızca müşteri kaybı değil, aynı zamanda **doğrudan gelir kaybı** anlamına gelmektedir.

Analiz sonuçları:
- Churn eden müşteriler nedeniyle aylık tekrarlayan gelirde (MRR) düzenli kayıplar oluştuğunu
- Düşük churn oranına sahip planların dahi yüksek birim fiyat nedeniyle ciddi gelir kaybı yaratabildiğini

göstermektedir.

Bu durum, churn analizinin yalnızca müşteri sayısı değil, **gelir etkisi** ile birlikte değerlendirilmesi gerektiğini ortaya koymaktadır.

---

## 6. Cohort ve Retention Analizi

Cohort analizi, müşterilerin **ilk başarılı ödeme yaptıkları ay** baz alınarak gerçekleştirilmiştir.

Elde edilen bulgular:
- İlk 1–2 ay içerisinde retention oranlarında belirgin düşüşler yaşanmaktadır
- Bazı cohort’lar, ilerleyen aylarda daha stabil bir müşteri sadakati göstermektedir
- İlk ayı geçen müşterilerin platformda kalma ihtimali önemli ölçüde artmaktadır

Bu analiz, churn riskinin özellikle müşteri yaşam döngüsünün erken aşamalarında yoğunlaştığını göstermektedir.

---

## 7. Temel Bulgular ve İçgörüler

- Churn riski en yüksek dönem, müşterinin aboneliğinin ilk aylarıdır
- Düşük fiyatlı planlar daha yüksek churn oranına sahiptir
- Churn, toplam gelir üzerinde anlamlı bir negatif etki yaratmaktadır
- Cohort bazlı analizler, müşteri sadakatinin zamanla güçlendiğini göstermektedir

---

## 8. Aksiyon Önerileri

Analiz bulgularına dayanarak aşağıdaki aksiyonlar önerilmektedir:

- Yeni müşteriler için geliştirilmiş onboarding süreçleri
- İlk 30 gün içerisinde churn riskini azaltmaya yönelik kampanyalar
- Düşük planlardan üst planlara geçişi teşvik eden fiyatlandırma stratejileri
- Yüksek churn oranına sahip cohort’lar için hedefli iletişim çalışmaları

---

## 9. Sonuç

Bu çalışma ile:
- Churn davranışı SQL tabanlı bir analiz altyapısı ile ölçülmüş
- Müşteri ve gelir kaybının temel nedenleri ortaya konulmuş
- Karar destek süreçlerinde kullanılabilecek sürdürülebilir bir analiz modeli oluşturulmuştur

Proje, abonelik tabanlı e-ticaret sistemlerinde churn yönetimi için güçlü bir temel sunmaktadır.
