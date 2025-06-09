import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/utils/my_http.dart';
import 'package:flutter_blog/data/model/post.dart';

class PostListItem extends StatelessWidget {
  Post post;

  PostListItem(this.post);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${post.title}", style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        "${post.content}",
        style: TextStyle(color: Colors.black45),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: ClipOval(
        child: CachedNetworkImage(
          imageUrl: "${baseUrl}${post.user.imgUrl}",
          fit: BoxFit.cover,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
