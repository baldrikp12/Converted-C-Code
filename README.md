# Converted-C-Code

Converted this C code to assembly.  
```
int find_min(int list[], int n) {
     int min, i; 
     min = list[0];
     for (i = 1; i  n; i++) {
          if (list[i]  min) 
               min = list[i];
     } 
     return min; 
}
```
