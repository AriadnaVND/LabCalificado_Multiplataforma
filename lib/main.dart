import 'package:flutter/material.dart';

void main() {
  runApp(const DisneyPlusLandingApp());
}

// =========================================================================

// APLICACIÓN PRINCIPAL Y TEMA

// =========================================================================

class DisneyPlusLandingApp extends StatelessWidget {
  const DisneyPlusLandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Disney+ Landing Page Clone',

      // Estilo de la aplicación: Tema oscuro
      theme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: const Color(0xFF040714), // Fondo muy oscuro

        // Usando una fuente similar al diseño (ej: Poppins)
        textTheme: const TextTheme(
          // Texto principal grande y blanco
          displayMedium: TextStyle(
            color: Colors.white,

            fontFamily: 'Poppins',

            fontWeight: FontWeight.w900,

            fontSize: 32,

            height: 1.2,
          ),

          // Texto del botón y subtítulos
          bodyLarge: TextStyle(
            color: Colors.white,

            fontFamily: 'Poppins',

            fontSize: 16,
          ),

          // Texto de los enlaces inferiores
          bodyMedium: TextStyle(
            color: Colors.white70,

            fontFamily: 'Poppins',

            fontSize: 12,
          ),
        ),

        useMaterial3: true,
      ),

      home: const LandingPage(),
    );
  }
}

// =========================================================================

// PANTALLA DE INICIO (LANDING PAGE)

// =========================================================================

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos LayoutBuilder para obtener el tamaño y asegurar que

    // el Stack ocupe al menos toda la altura de la pantalla.

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: <Widget>[
              // 1. Imagen de Fondo (assets/images/hero_background.jpg)

              // Usaremos Asset para simular la imagen local/precargada
              Positioned.fill(
                child: Image.asset(
                  'assets/images/banner2.png', // Reemplaza con tu imagen local

                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    // Si la imagen no carga, mostramos un color de fallback

                    return Container(
                      color: Colors.black,

                      child: const Center(
                        child: Text(
                          'Fondo de Jugadores (ASSET NO ENCONTRADO)',

                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Overlay oscuro para mejorar la legibilidad del texto
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.4), // Capa de oscuridad
                ),
              ),

              // 2. Contenido principal (Se puede desplazar)
              SingleChildScrollView(
                // Asegura que el contenido ocupe al menos la altura de la pantalla
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),

                  child: const Padding(
                    padding: EdgeInsets.all(20.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: <Widget>[
                        // Contenido de la parte superior (Header)
                        _LandingHeader(),

                        SizedBox(height: 150), // Espacio para el centro

                        // Contenido central (Logo y textos)
                        _CenterContent(),

                        SizedBox(height: 30),

                        // Formulario de Email
                        _EmailForm(),

                        SizedBox(height: 20),


                        // Enlaces y detalles inferiores
                        _FooterLinks(),

                        
                        _BrandsRow(),
                        SizedBox(height: 40),

                        // Sección de deportes
                        _SportsSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// =========================================================================

// WIDGETS AUXILIARES

// =========================================================================

/// Widget que recrea la cabecera (texto "UEFA Champions League" y botón)

class _LandingHeader extends StatelessWidget {
  const _LandingHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        // Texto superior izquierdo
        Text(
          'UEFA Champions League',

          style: Theme.of(context).textTheme.bodyMedium,
        ),

        // Botón INICIAR SESIÓN
        ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,

            foregroundColor: Colors.white,

            side: const BorderSide(color: Colors.white, width: 1),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),

            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

            elevation: 0,
          ),

          child: const Text(
            'INICIAR SESIÓN',

            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

// =========================================================================
// SECCIÓN DE MARCAS (Disney, Pixar, Marvel, Star Wars, etc.)
// =========================================================================

class _BrandsRow extends StatelessWidget {
  const _BrandsRow();

  @override
  Widget build(BuildContext context) {
    final List<String> logos = [
      'https://upload.wikimedia.org/wikipedia/commons/3/3e/Disney_wordmark.svg',
      'https://upload.wikimedia.org/wikipedia/commons/2/2d/Pixar_logo.svg',
      'https://upload.wikimedia.org/wikipedia/commons/b/b9/Marvel_Logo.svg',
      'https://upload.wikimedia.org/wikipedia/commons/6/6c/Star_Wars_Logo.svg',
      'https://upload.wikimedia.org/wikipedia/commons/4/4d/National_Geographic_logo.svg',
      'https://upload.wikimedia.org/wikipedia/commons/5/58/ESPN_wordmark.svg',
      'https://upload.wikimedia.org/wikipedia/commons/e/e4/Hulu_Logo.svg',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(logos.length, (index) {
            return Row(
              children: [
                Image.network(
                  logos[index],
                  height: 40,
                  fit: BoxFit.contain,
                  color: Colors.white,
                  colorBlendMode: BlendMode.modulate,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image, color: Colors.white54);
                  },
                ),
                if (index < logos.length - 1)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}


/// Widget que contiene el logo y los textos principales del centro

class _CenterContent extends StatelessWidget {
  const _CenterContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Logo de Disney+ (Imagen local - assets/images/disney_plus_logo_white.png)
        SizedBox(
          height: 60,

          child: Image.asset(
            'assets/images/disneylogo.png', // Reemplaza con tu logo local

            errorBuilder: (context, error, stackTrace) {
              return const Text(
                'Disney+',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // Título principal
        Text(
          'Series exclusivas, éxitos del cine, el deporte de ESPN y más',

          textAlign: TextAlign.center,

          style: Theme.of(context).textTheme.displayMedium,
        ),

        const SizedBox(height: 20),

        // Subtítulo
        Text(
          'Ingresa tu correo para comenzar',

          textAlign: TextAlign.center,

          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

/// Widget que contiene el campo de texto y el botón de suscripción

class _EmailForm extends StatelessWidget {
  const _EmailForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Campo de Correo electrónico (Usando Card para simular la elevación/estilo)
        Card(
          margin: EdgeInsets.zero,

          elevation: 0,

          color: const Color(0xFF333333).withOpacity(0.8), // Fondo oscuro

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),

          // Usamos Padding y TextField para el input
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),

            child: TextField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',

                hintStyle: TextStyle(color: Colors.white60),

                border: InputBorder.none, // Elimina el borde del TextField

                isDense: true,
              ),

              style: TextStyle(color: Colors.white),

              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ),

        const SizedBox(height: 15),

        // Botón SUSCRIBIRME AHORA
        SizedBox(
          width: double.infinity,

          child: ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFF007AFE,
              ), // Azul brillante de Disney+

              foregroundColor: Colors.white,

              padding: const EdgeInsets.symmetric(vertical: 18),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),

              elevation: 0,
            ),

            child: const Text(
              'SUSCRIBIRME AHORA',

              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

/// Widget con los enlaces inferiores

class _FooterLinks extends StatelessWidget {
  const _FooterLinks();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),

      child: Center(
        child: RichText(
          textAlign: TextAlign.center,

          text: TextSpan(
            text: 'Ahorra desde 30% en ',

            style: Theme.of(context).textTheme.bodyMedium,

            children: <TextSpan>[
              TextSpan(
                text: 'Disney+ Premium Anual',

                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,

                  decoration: TextDecoration.underline,
                ),
              ),

              const TextSpan(text: '. '),

              TextSpan(
                text: 'Ver detalles de los planes.',

                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,

                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =========================================================================
// SECCIÓN DEPORTES Y PLANES (PARTE INFERIOR DE LA LANDING)
// =========================================================================

class _SportsSection extends StatelessWidget {
  const _SportsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),

        // Imagen y texto principal (ESPN en Disney+)
        Column(
          children: [
            Text(
              'ESPN en Disney+',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'El deporte de ESPN y los eventos en vivo que te apasionan los encontrarás en el plan Premium de Disney+.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007AFE),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: const Text(
                'SUSCRIBIRME AHORA',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        // Logos de F1, Premier League, UFC
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _SportCard(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/3/33/F1.svg',
            ),
            SizedBox(width: 15),
            _SportCard(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/en/f/f2/Premier_League_Logo.svg',
            ),
            SizedBox(width: 15),
            _SportCard(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/0/0d/UFC_Logo.svg',
            ),
          ],
        ),

        const SizedBox(height: 60),

        // Texto final “¿Qué plan vas a elegir?”
        Column(
          children: [
            Text(
              '¿Qué plan vas a elegir?',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Podrás modificarlo o cancelarlo cuando quieras.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

// =========================================================================
// CARD INDIVIDUAL PARA CADA DEPORTE
// =========================================================================

class _SportCard extends StatelessWidget {
  final String imageUrl;

  const _SportCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          color: Colors.white,
          colorBlendMode: BlendMode.modulate,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Icon(Icons.sports_soccer, color: Colors.white54, size: 40),
            );
          },
        ),
      ),
    );
  }
}

