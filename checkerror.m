// CheckError
// Function that extracts human-readable information from OSStatus codes.
//
// Credit: "Learning Core Audio: A Hands-on Guide to Audio Programming for Mac and iOS", by Chris Adamson, Kevin Avila
// IDECodeSnippetIdentifier: 2364DAA9-16A6-4FB0-8180-6278FE22EF28
// IDECodeSnippetLanguage: Xcode.SourceCodeLanguage.Objective-C
// IDECodeSnippetUserSnippet: 1
// Language: C
// Platform: All

static void CheckError(OSStatus error, const char *operation) {
    if (error == noErr) {
      return;
    }
    
    char str[20];
    *(UInt32 *) (str + 1) = CFSwapInt32HostToBig(error);
    if (isprint(str[1]) && isprint(str[2]) && isprint(str[3]) && isprint(str[4])) {
        str[0] = str[5] = '\'';
        str[6] = '\0';
    } else {
        sprintf(str, "%d", (int)error);
    }
    
    fprintf(stderr, "[Error] %s (%s)\n", operation, str);
    exit(1);
}
