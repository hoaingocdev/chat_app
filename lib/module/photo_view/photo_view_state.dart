part of photo_view;

class _PhotoViewViewState extends TTState<_PhotoViewModel, _PhotoViewView> {
  @override
  Widget buildWithModel(BuildContext context, _PhotoViewModel model) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            pageController: model.pageController,
            backgroundDecoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
            ),
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(model.images[index]),
                initialScale: PhotoViewComputedScale.contained * 0.8,
              );
            },
            itemCount: model.images.length,
            loadingBuilder: (context, event) => const Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 10 + MediaQuery.of(context).padding.top,
            child: IconButton(
              onPressed: model.onClosedPressed,
              icon: const Icon(
                Icons.close,
                color: Cl.colorFFFFFF,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
