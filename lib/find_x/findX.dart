import 'package:findx/data/file_types.dart';
import 'package:findx/functions/google_query_gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindX extends StatefulWidget {
  const FindX({super.key});

  @override
  State<FindX> createState() => _FindXState();
}

class _FindXState extends State<FindX> {
  Map<String, bool> selectedFormats = {};
  final TextEditingController _controller = TextEditingController();

  static const backgroundColor = Color(0xFF1A1B25);
  static const surfaceColor = Color(0xFF242632);
  static const primaryColor = Color(0xFF6C63FF);
  static const secondaryColor = Color(0xFF00D9B5);
  static const textColor = Color(0xFFF7F7F7);
  static const secondaryText = Color(0xFFB4B4B4);

  @override
  void initState() {
    super.initState();
    for (var formats in fileFormats.values) {
      for (var format in formats) {
        selectedFormats[format] = false;
      }
    }
  }

  String getSelectedFormatsString() {
    List<String> selectedList = selectedFormats.entries.where((entry) => entry.value).map((entry) => "filetype:${entry.key}").toList();

    if (selectedList.isEmpty) return '';
    return selectedList.length == 1 ? selectedList.first : "(${selectedList.join(" OR ")})";
  }

  @override
  Widget build(context) {
    final isDesktop = MediaQuery.of(context).size.width > 591;

    return Scaffold(
      body: Container(
        color: backgroundColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gradient Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                gradient: isDesktop
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          surfaceColor,
                          backgroundColor,
                        ],
                      )
                    : null,
              ),
              child: isDesktop ? buildDesktopHeader() : buildMobileHeader(),
            ),

            // Search Instructions
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline, color: secondaryColor.withOpacity(0.7), size: 20),
                  const SizedBox(width: 12),
                  Text(
                    "Select file types for your search",
                    style: GoogleFonts.spaceGrotesk(
                      color: secondaryText,
                      fontSize: MediaQuery.of(context).size.width < 370 ? 12 : 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // File Type Selection
            Expanded(
              child: buildFileTypeSelection(MediaQuery.of(context).size.width),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDesktopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildLogo(),
        const SizedBox(width: 40),
        Flexible(child: buildSearchBar()),
      ],
    );
  }

  Widget buildMobileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildLogo(),
        const SizedBox(height: 32),
        buildSearchBar(),
      ],
    );
  }

  Widget buildLogo() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Find",
            style: GoogleFonts.spaceGrotesk(
              color: textColor,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "X",
            style: GoogleFonts.spaceGrotesk(
              color: secondaryColor,
              fontSize: 44,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: primaryColor.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: GoogleFonts.spaceGrotesk(
                color: textColor,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your search query...',
                hintStyle: GoogleFonts.spaceGrotesk(
                  color: secondaryText.withOpacity(0.7),
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: secondaryText.withOpacity(0.7),
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
              cursorColor: secondaryColor,
              onSubmitted: (value) => googleQueryGen(
                context,
                getSelectedFormatsString(),
                value,
              ),
            ),
          ),
          const SizedBox(width: 8),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => googleQueryGen(
                context,
                getSelectedFormatsString(),
                _controller.text,
              ),
              child: Container(
                height: 46,
                width: MediaQuery.of(context).size.width < 480 ? 46 : 120,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryColor,
                      secondaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: MediaQuery.of(context).size.width < 480
                      ? const Icon(
                          Icons.arrow_forward_rounded,
                          color: textColor,
                          size: 24,
                        )
                      : Text(
                          'Search',
                          style: GoogleFonts.spaceGrotesk(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFileTypeSelection(double deviceWidth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        itemCount: fileFormats.length,
        itemBuilder: (context, index) {
          final category = fileFormats.keys.elementAt(index);
          final formats = fileFormats[category]!;

          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: primaryColor.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.folder_outlined,
                      color: secondaryColor,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      category,
                      style: GoogleFonts.spaceGrotesk(
                        color: textColor,
                        fontSize: deviceWidth < 370 ? 15 : 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: formats.map((format) {
                    final isSelected = selectedFormats[format] ?? false;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedFormats[format] = !isSelected;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    primaryColor,
                                    secondaryColor,
                                  ],
                                )
                              : null,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? Colors.transparent : secondaryText.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          format,
                          style: GoogleFonts.spaceGrotesk(
                            color: isSelected ? textColor : secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
