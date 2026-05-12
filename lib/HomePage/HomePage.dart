import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartBite'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            icon: const Icon(Icons.logout_rounded, color: Colors.greenAccent),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.greenAccent),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.greenAccent),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Your two buttons in Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/user');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("User Mode"),
                      ),
                    ),
                    const SizedBox(width: 16), // better spacing
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/Admin');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Admin Mode"),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24), // space before carousel

              // Carousel added here ↓
              CarouselSlider(

                options: CarouselOptions(
                  height: 180.0,                    // adjust height as needed
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,           // shows part of next/prev
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: [
                  // Replace with your real images / content
                  _buildCarouselItem(
                    'https://picsum.photos/800/400?random=1',
                    'Welcome to SmartBite',
                  ),
                  _buildCarouselItem(
                    'https://picsum.photos/800/400?random=2',
                    'Fresh & Healthy Meals',
                  ),
                  _buildCarouselItem(
                    'https://picsum.photos/800/400?random=3',
                    'Order Now & Save',
                  ),
                  _buildCarouselItem(
                    'https://picsum.photos/800/400?random=4',
                    'Daily Special Offers',
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // You can add more content below carousel
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Cuisines",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 40,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('data:image/jpeg;base64,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'),
                            fit: BoxFit.cover
                        ),

                      ),


                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('data:image/jpeg;base64,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'),
                            fit: BoxFit.cover
                        ),


                      ),

                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('data:image/jpeg;base64,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'),
                            fit: BoxFit.cover
                        ),

                      ),

                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQBDgMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAFAAIDBAYBB//EAE0QAAEDAwEEBQULCQcCBwAAAAEAAgMEBREhBhIxQRMiUWFxFFKBkdEVIzIzQnKSk6GxwRYkNENTc4Ky4QdUYmN00vGDoiUmNTZVlML/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBP/EACERAQEBAQEAAQQDAQAAAAAAAAABEQIhQRIxMlEDInGB/9oADAMBAAIRAxEAPwD0pcTOk710PUaSiNxYXBpLRzTcJNk5AkdyeNUEeEiFLhcIUEWFzClIXMIYjwkQpd1LcTVQ4Tm9Ugg4I4FSbiQZqmh+HVD2vmflwGhTzSR+eo2tcOCf1u1EMdTDz1C6EKwWuTDG5NFZzFGQrTonKN0R7D6lNVUcoy5TyRO71E6N3mn1JpiIlMUhjd5p9SQjcfku9SmmGtGVMxmqTIjn4J9SsxRHsPqUUo41ZZGnRx4ViOJznABUMjjJOBxVkMZAwyTHJHBvauTTxUbDnDn+KzF2u4J3ZJmtzwy7CGCFzu5dvBrsDkFnauqfICoJquItc980YaBkkuGB3rE3jbeF83klmHTSu6omxkfwjmoo7dLnBRNLp5d08mjifQsnWXWvusvk1DG9rToGxZL3eJ5Iladka+4zx1N3kdCx5yWu1kPsW2paG3WKBgp6Z7cua3fjYXFxJwMlZ+pZGA/Jaot9Aaysc0SEhoibrx5krMbRQ7krfFeo7RXSlqInUcTn9O1wLm7hw3GMgnhnwXm+1Lffh85dv4/edcuvye7VM01OcTROB8FV90mB2CcIjS7U0tUzcqo2v8dVLNabTcxv08vRPPLiFjWsVrbdmx73B2mmeSItveRjdZ6lmZra+iqpYmSNcGnBSIljGXOHoKo0/uz3N9S4b2RrusPoWX8p3eLvsVcXaE1TqbL+lawPIxpgnA+4qDWm/Y4sZ6lz8omD5DfUsm+tZ3+pVZatp7R6EVthtGzzGeoLo2iZ5jfUFgn1IbgknB7lLHI5x0dp4qGNyNoGH5DfUE9t9addxvqCx0ZcB8JTB7uAKGNb7ts81n0Uvdtnms+iskJHcil0ju1XTGs93Geaz6KXu5H5rforJ77u1IOeRnVDGr93ofMb9FcN9gz8Bn0Qsk4vHaoJHyYPFQxszfoP2cf0Qmm/0/7KP6IWBkqnAkEnPioXVpHMpo9EN+pv2Uf0Que79N+yj+iF515aTzPrThWE8+Hemj0T3dpzwij+iE4XuA/qo/orAR1LiRxRGlk3sHKasjbQ3OOQ4ELfUpqmubHTuc0NbgansWY8rio4uknkwByHE+hA7peam4gsaTFT8mDi7xKqLd3v5kcWU53nc3HgFm6tzzJFJI4uc5519BU0ceOSiuHVbTn/ADD9xQ1T2jqXRWSdm91pG7ueaxuwkLBtbatP1ruX+ByP7Szb7BFn4LCSF3+zKippZK+7VdPNK+ha0U+4dxkbiHAue4kN4EaE51OAnwfL1QQufLAGt1zgd6H3i6x0MopowJajfGYgetjOTj0AoLWba0sNJBG6odUyjUxUAMbQT50rhk/whZ0m+XyoJo6PyaFzt4FuWAaY+GdXaHllYyNbRe9VnldQGtLYAxpJg3xvOJI1IHtWE2rHv4+ctedmJbRCaqpqRLK4bpDW6a951KyO1fx4+cu/H4OPf5NB5YWnehky3tBRGhvtRE8BshyO9ZfaGpEd1mEUbWMAAGBunKsWSZ8xlLjlrMADGuVyk1116PS1slTE2aQ9Z+p+5STS5ah9t/QYvm/iVZcchaZpj3aoQ3/3DP8A6WP+ZyKniEODf/ME/dSx/wAzkRaI7U0x5BUj24wnRsJRVeqh/NCTycEJt8jxrvk5cVoLoAy2SHHMD7VnaEjdCA4yXeAypWZcdDjVVIjoFcgQSxDqanmfvUmdFFGcg+J+9OYSXEIO6k8VXDTu8eJV1rRlRNYN0eKCm/OcZUTge1WZW9bKic3QolZl9FcKqvnDLlM1hkIa0BuGjPgrf5P1rm7zbvJkHBG63I+xVJbnE2smilkdGGzn4uRrToeZLkcst8ts9YG1hYyM5cXNniBJAwASX965e66zMDbjs5dKMgS3SVp3d7dLW5Ix4KG1We51dIJn3KUbwBGGt1z6EavN9o661zVtTVRvq4pXRxiKSIDcBxqA8k+KZZNobdDbIIpXsa4NaCBNEMYx2u7kukxGzZ25sgL/AHUnBHYxvsXK22Xeionztu84cIy4dRnEDPYjf5UWvoHDpm6DX3+H/eg162nop6aobE/OYsMHSRnkexyz7rXizTSS1lupJ53mSR0DC5zuZLRn7U8R6cE2x9axUP7hn3K1hdnJBuYx3qnd27sdMf8AMP3FEiBp4oZtMdylhI475+4ojGXSUyundx0I18EM2WgluV6orW+R0dNUSnfa0nBIaTnHAnq4yiVQzMMp7WlN2FGNrrSRjSV2vf0b03xZPXqlv2YttCIzHAHyB2rpOsUYbEyOQ4bo4bvpT5ZIoHU8kz2sj3QSSeZahdRtBbYXx076jekM2cRtL94uxgDdznguToh2uwLezGOsQ4eC8l2q+OHzl6HfLy6ra2idRzQljBh7iMOAPZnPPsXnu1Xxw+cvR/H+Dh3+Se4Wq5Xa5zS0sLixres5/d+Kl2Wa7FQHjHXHHwRCqqfJL7RMMjoxJHKZAXaOOmMj06LlrZuVVSMYG8D9ixw6dddXn1s6EfmcWOz8SpXHGiZQ/ocXh+JTnDrcVqsG8SFRaAdoaj/Sx/zPREN5oBc6t9HfKl8TWF/kALGPJwXB/djtKgOOjJxopoWa4IWM/Ke6MaHGjpBrggNf/uTmbVXVzveaSmJHPceP/wBINZfsNtcnzm/esvRnRqnorvcrwyppatkUZG7uBumeedT26Kams08Baaqemgjc7Akklw0nsTBPC/kr0DlFFQRN43S3fX/0VmOGJg1uNu/+xj8FcqbHIjp6T96mj0KbHHAGk+6NvO7q7E/D7FKw0oGtyoPr0yrsSngMKuwndHirULGTaR1tCTjOBPyHHkodyJke8Lhbi0OxnykcfUmVNiKQA8lCR2q2WQFm8bhQAcP0gKGVsEYJNxtpH+pGqYbAFtopJ6mV0ojLpJTneI45VwWG3TMDegj1eNQO4rKRy1sd5r5nwOmgkkfuRb3wDwB+xX6qbaGV0RtrPJI2t3d3IOXbuN7hx4lcLz793eXz7DlwsdsgwXwsBOcDd46Kns7s1Sz29skkTC52oyNQhZdtT0jX1zumaGEAAD18OK5SXu/Nt0cFshDZGEhznxNc0t5Y7+KmGxrW2Ghja8MgZkN1OFVuVlpfcybEEe+2IkHdHYhduuW0wErpqdkoIOMANwFNcLlfJLdKX0IYws+HvA4CYuiNgaPcaiAH6ln8oV7cxx0QKzXCqNtpo6W2VErhGwbziGt+CPFEIPL5qtlPXTQ2oSNc5sj4y/eA44OvaOOF1jlf2tkAt0QLamRjoadgkZvdJqN7lhHnW3Z5pzX7RVlV2iIbjSm+U7F0IzDbOncNQ6eVzs+hb+ln6nnlQzMMm7g9U8EP2ZndBfaGSPL5GSHdjhPXcd1wwDy4r1C5bc0MdtqYbdQUtO10Lm9SMDiCsH/ZrbKir2noKmlhdJHSSgzvb8gOY5o9ZWeovN1p/IbzVzOkZb92KQbrW1MpeG+g6fYrMWyl1dTwtmr2RMjlYGshbjDnHQ6di9CbRSuDS2E8cjIVyGPomxCYBruk1yscza31ZI8tuGzYtsVVVOqZ6hzJOi6R50JyFgtqfjh85eybZSRGw1AY+Mk1TTgO5YC8b2o+OHzl6OZnLjb6I36A9Jb4i3JZOCMjuV+hcHVMx4ZKG3aoPlNG6INlIk1O8dD3q7bWyNmkL2kDIweRXLieunX2bahH5nF4fiU9w6yjoT+ZxeHtUrjqtfLJzBkhZLaSaWDaRroXBrjRgHqh2m8e1axjsELL3ujmr9pN2HHUpBnJxxcUFekkrKipfGZRgZ/Vt9iZG+rkcffNAcY6NvsROjslcyYvc2JwOTjeU3uLXsk6RkcLRybkexAIoC8XJxe8uLQWjQDHDsVrbWYt2epGtIwagk69jUm0VRBWPlmDBvcd05QrbupxZ6RnMTn7lSssah403wPSU9laWHWTB7gVpdktkbZf7bNUy3CqhqaYOdPF0QDcYJbuk8Vj6uN0Ya8NeWE4G8wtP2gLUrni265Tg53sE6cMaKWCvrnCZ0LXSNazrlkeQwdp00Qcbz8brXHvAOEW2fY/pLlvmaPFtqHbreZ3cDPbxOhV0w915qngYmcABwacDhhKluM4eC529GR1t7gQhZJa/DIpMA9UvYfu4Lj3vOTI45PL+iJgrNOGticJZN14yAf+VXqKqMwuDXvJ3ODxp6FDHE6Vm61gA84n7VFJBHGXRyPeSNXdGARgd571Ksj02iuFGAHSvZ0u+SdT/tRqK+0bGx6DV2mrtND/AIVPsHbLRcoKjy6COeRjA4bzi0jt4FHIrVSVD5G0MlOI4H43S4nl/Vea8+vRLMAa6/0RY7QcO12v/agFjvtrp7VTdM6EVDqsMnaZSN2LeIJxjTTGq1N9kgoYXukko3YB6rXHKwVuuezkMLmV00LZXAuILCcaZ5BJM+F/62U+0FnZSSGlkgLzI1jD0pOGnGT8HhqUKvG0cDLcWtDJd4ujwx+MY4O1A0VzZ6t2fuZkpaKendII98gtI0z38VNeKi0vtU7GOhIa1wzpxA/4Uv8AhP8AVbZnaW2QUcEEvRNkjiDCDMMkho5KLba8Udx9zIrc+Oeoc5zRFE7Lsnd0x6ChNkGz77Y6atuzLdUMp+kYG7gMpwdCSCcZxwQzZBwqbzYZqkYqPKKgne46RnHHxW/tNY+cMu1uu1sgbUV1K+KJxwD0jT1vQUF8rcQQX6DvXoH9rVe2K10ELN33yYkNB1wGn+iz9TZadlgpIsME3StJqMBh6+T1j2AYxwWp356zeWfYypqAGxQyuDzul4jJaPEgLQWmau2KdLK+rizUBm8IHEfBydc+K0NsidYrPQspy5rJXunDnPDiXYxy0xg8MIBtG+OpeyKYks5EHVOrbfG+JOZ6N0+0t2uFtkuEZb5LG8sMktQ4ZI48Fb2dvFwu8G9DbKGVrJD77O953j4IJRmKm2bfbWHepnOMnWwXb3j6Fo9inRw23qgaHgsdby1JOkF5hr4bfL5VTW6ON829vU8eHg6aZ7F53tNrMPFelbUXVlRROpxEQd4HK8z2j1lHiu38d3lx7mVJTxNb5vcjdvw0DGip3WOKK9V8FOQYY6mRjS0YBw4gkDkNFYozwV5pW1o4pjQxOa4bu72eKeWv4F5+iERsjQ6002QCSz8SrUlIx4Ogysb60CBjwfhk/wAIVOnyNpJ3nXFHGNR2ud7Ealo3MOW8EIY1zNoKtpGvksP8z1UFWSA8gPBPc/PFVQ7CdvoILhQwVEeHF4yRq12EHk2bhlwH1tS4A5Gd0/gjkzgQ35wXCRvJoDDZ1rBiO41rfBw9ijm2cbI12/cKt2ASN4tONPBHzjCjfjo3/NP3KaYCs2bYzRlfVNHcG+xOOzbC0g3KrweIBaM/YjGeKYCTxJTaZAk7OgjJuNXp832KJuzURw43CoLuOS1nsRzPJMYRujwKumAh2Yh/+RqvU32KM7LU7iWmtqcdmG+xHAesu5wcppgPS2LyVz/J7nWx7wIJa4DT1Lkdi6B7nwXavjc7QljwM/Yi7ACC7PNMkOuB9ygAVGy0FQ/fmrauQ9riCfuUB2Po856ecnvx7FpRjGufUoJnaaZ9SDPO2YpIwd2onBOmm77ERtOx8D6R4bXTDr9VrgCB6MKZwzk4PrR2wn8yf888kAJ2y1XA/eiqIZHFu6A9mOr2J8FNX0cjHzWmCrMeoO/7Dlah3cmElACrLtbpCJLps7MZPglxfwHdvBUbtXWC60zaZrq2ki03t2IPzjhwK1gzjiq09JTTOzNTwvPa5gJUsl+6y2MbcKxxooqO1OM0VM3DfeHhx4d3d2rP1dNeZjpRSk9u472L0iOngpKlzKaNsbXt3nAcyrOdRqfWtyRnrq15zSU92FMRJRTOk4NZ0bgPHKM2Grutu3hJbJHgnOAHD8FsmnAxyU2/niVLzLVnVjFXCaqqnl5ttRE3HHBI+5ZPaESdKPeZuP7Mr1qrIDDgDXuWHv598HitTyZGb/a+qLLbUDrHVvOQAkHvzhE2W2SnphUumhLM43Q7rE+r8UVhr6BsRqDTvjaHFpDnOfn1E5GqfDU22eBrreKKcF2oB393loMrMasaawH/AMIpfmfiVf8AlIZbLiI2NjMLTG0fJaBj0ItHVU74+kaGFvM50CxWpCwMIK2Jsm1FWCB+hRH/ALnq5VX6hiO6wNkcPN4Kte6mBz6SOna0VVW5ofIzR3RN6xGR6vSnNOvFxlFAJ29M4bgGTg8e5U6yBond5O0iLlkqzEMu4D0BXOjDhgrd8ZjOyn4II+UEidSUXq6Bjg0gAdYclUloC0EtKiqnSBNkd72/5p+5d6J7dCEx4IY8HzT9yIcScLjDqugLoGqDjx2KFp6o8FZLeoomR9RvgiocEHOVJnTK69iWgGCEA2egZNM+TpagAngyUgepQe5cOcmap+vd7UT+Rk9p+9ROBdzKCi62wbuk1T9e72qF1tiH62pP/Wd7UTDCmPbhAKNBEwg9JOSDpmVxWnsYxQv/AHh/BBiNUasg/NHfvCgvH4aaeJTncVWrKbypsYbPLC5jt4OjdjljUcx3IiwOCjcdUONTcKQe/wALaqIfrIdHDxarFHX0lacRSjf5tdoR6EEU5/Pf4PxUrNVBU6V+B5n4hTxELbKUnAT4znionKSMoGVPxaxF++MHitvUj3tYe/fG+lBpZP7O4auoZV110rWzs6oEEwIAzwyW5Vt1ms1naHzVE8szfgnQvPpARyWvHIl3cNAs9eaS53aoijoafI5uPVaPE+xcv7OuxBW3WmaMQQOA7ZZC8+rKGPuVZcJfJ6SGWok4CONpP2DQLU2nYGIATXeodUO49FEd1vpPErX0VBTUUIioqZkEfmxtx6+30pJ+039PMmbMX54BkpzG7iW7wJ+w4ViyNqprvUurXZkpIxAByBOpGngvQ7nK2ht9TVyaNhjc85HYFhNkY3OtgqZPjauR0rvSV05mMUQulPd54om2fea4EmRzcegaob7n7ZcppvQWe1b62w7tEzB+ESfwVnoj5w9KlWPODb9s/wBtL6XM9q4bbtkRrNL9JntXpHRDm5qXRs5v9SyrzF9q2vdxklP8bPaq0tj2wdwE31kftXqpEbRjecVDIYux3rQeSTW3bGMY3Kg47JY/aqrqXbMHSOq+tj9q9amMfJmqqmJp1xxWoleWmn20/Z1n1kftXBBtn+zrPrGe1epGnHaW+C4KYecVUeWmm208ys+tj9qhfS7ZDXFV9dH/ALl6z0DexRSQs7EV5R5Jte7+9Y/fR+1MdBtazj5V9cz2r1R0MfmhRmmZzQeWmDaw6jyr65ntTfJtrT/evrWe1eoto425wBr2rvk0Xmtyg8pfSbW4P6V9az2ops5ddoLU+UXaB81IdSS5pcw92D9hW9dTxg/AUE9DG9hIbqgfTVlPXQiallbIw9nEHvU3ALKzUVTb6g1NveYyfhR/Jd4hGLVe6e4jone8VQGDG7me5TASbwVOtt9JVfHRdf5MjBhw9IVprcac+eE7dB1UANlO6kqXRvnkn6oLHPxkDsV5ncoK07txx/lfipGFbZSqSNyY1SNCBVHxaxF++O9K2tS7qLFX3430oPXKO1U8HWkb0zv8Z09X/KIiQgANawN7AgjtprX8mVx/gKadp7YODpnDuiWWmia6QjQgDwXC52NXfYgI2ptvyfKD/wBL+qX5U2/zajP7tMA/+02udS7N+SteTJWSiIeHE/corfEykoYYyQxsUQyToG4Gqz2191ZfdprVSwNcIodXB/nE5+5o9au7S9JX2zyaikdG5xPTb3BzfNWoj0ChLH0NO+LO4+Nrm57CMqfCGWIugslBDLq+KnYx2O0DH4K703mtKyqXCRwAoeleeDSmGR/YmCVyryAFIuceJUZcUwNLAudE3tK7vJEqo4Y29pXOjb2ldJXUDeib2lQviHaVZTHIuqjoQmmMKw4KMtQ1AYwudGFK5hKjcxwUDHRjgeajdHu5BOikLXBO0Iw4IB9RShzeXis/dbO2Q9JGS2XOjgMetaeQEHB4clWmZvhVWdob7NRyCmuodgcJh+PaO9aaORkrWviLXNcMgtOQUFr6GOZhY8aH7EFinrbDNlh6WkJ1Y7h/RTE0fuX/AKkP3X4rsZQ6e80NRUiZsvRtMXWD+Ryk29Wwca2L7VpmjDD1SpWHHFCW3y14/TYvtTjfLZ/fY/tVwEKg9RY29nMvpR2e+20sx5ZH9qyt3udE6Tq1DDqlhB4EqZhKSSw0nYSrULQ4jKSS0gFQAP26eHcGuOO7DdFq2gOfG0jRzgCkkkGmskz5aOVz8EsqJIx4A6K855HDCSSyqN8rhwKiMjjxKSSCMuPauA6JJKlLmupJIjoXQkkgS4VxJBG5NSSRHOaWAkkqrm6M8F0Mb2JJKBksLHDJHBUZIW64yFxJBRqI2hDKtjd1wIyMag8CkkoMpdKeOnneyIFrSzOOxBA4jRcSXThinh5XekKSS6CGWRyE1j3F2qSSxSP/2Q=='),
                            fit: BoxFit.cover
                        ),



                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Working Chefs",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('https://media.gettyimages.com/id/2169392890/photo/woman-prepares-a-meal-and-looking-for-recipes-online.jpg?s=612x612&w=0&k=20&c=jAIsKfB2ZdM6wLkiKdtsDjXv8dEXFr61w2Oc3D1fg1g='),
                                fit: BoxFit.cover
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('data:image/jpeg;base64,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'),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('https://media.gettyimages.com/id/1365376076/photo/bakery-owner-on-the-phone-in-the-kitchen.jpg?s=612x612&w=0&k=20&c=rMK4T2p3iw5GEeoiBq7rd6HC4NXCJLMOEknCQ8lOvIw='),
                            fit: BoxFit.cover,
                      ),
                    ),),
                    SizedBox(width: 10),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage('https://media.gettyimages.com/id/96615492/photo/three-chefs-looking-at-the-camera.jpg?s=612x612&w=0&k=20&c=UU-xD2l-9iUKH3GZ0dl9bDnmfgD9PCKIFkCtSUZP56Q='),                        fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Colors.grey.shade900,
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [


                    
                    // Social icons row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.facebook, color: Colors.white70),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.language, color: Colors.white70),
                          onPressed: () {}, // website
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.install_mobile_rounded, color: Colors.white70),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Copyright line
                    const Text(
                      'SmartBite • Made with ❤️ in Pakistan',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                     Text(
                      '© ${DateTime.now().year} All rights reserved',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
              // ... more widgets
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build each carousel slide
  Widget _buildCarouselItem(String imageUrl, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(16),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}