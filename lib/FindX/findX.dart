import 'package:findx/Data/fileTypes.dart';
import 'package:findx/Functions/googleQueryGen.dart';
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

  // Custom Color Palette
  static const backgroundColor = Color(0xFF1A1B25); // Deep navy blue
  static const surfaceColor = Color(0xFF242632); // Lighter navy
  static const primaryColor = Color(0xFF6C63FF); // Vibrant purple
  static const secondaryColor = Color(0xFF00D9B5); // Turquoise
  // static const accentColor = Color(0xFFFF6B6B); // Coral
  static const textColor = Color(0xFFF7F7F7); // Off-white
  static const secondaryText = Color(0xFFB4B4B4); // Light gray

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
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final isDesktop = deviceWidth > 591;

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
              child: buildHeader(isDesktop),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // File Type Selection
            Expanded(
              child: buildFileTypeSelection(deviceHeight, isDesktop),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(bool isDesktop) {
    final searchBar = buildSearchBar();

    return isDesktop
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildLogo(),
              const SizedBox(width: 40),
              searchBar,
            ],
          )
        : Column(
            children: [
              buildLogo(),
              const SizedBox(height: 32),
              searchBar,
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
          SizedBox(
            width: 320,
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
                width: 46,
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
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: textColor,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFileTypeSelection(double deviceHeight, bool isDesktop) {
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
                        fontSize: 20,
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
                              ? LinearGradient(
                                  colors: [
                                    primaryColor.withOpacity(0.8),
                                    secondaryColor.withOpacity(0.8),
                                  ],
                                )
                              : null,
                          color: isSelected ? null : backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected ? Colors.transparent : primaryColor.withOpacity(0.3),
                            width: 1,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              format,
                              style: GoogleFonts.spaceGrotesk(
                                color: isSelected ? textColor : secondaryText,
                                fontSize: 14,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                            if (isSelected) ...[
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.check_rounded,
                                color: textColor,
                                size: 16,
                              ),
                            ],
                          ],
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
